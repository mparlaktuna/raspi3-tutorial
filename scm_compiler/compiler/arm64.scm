(define-module (compiler arm64)
  #:use-module (ice-9 eval-string)
  #:export (compile-tests
	    compile-exp))

(define x0 'x0)
(define x1 'x1)
(define x2 'x2)

(define w1 'w1)
(define w2 'w2)
(define fixnum-shift 2)
(define true-tag     #x6F)
(define false-tag    #x2F)
(define nil-tag #x3F)
(define char-shift 8)
(define char-mask  #x3F)
(define char-tag   #x0F)

(define f-name-counter 0)

(define (compile-exp x)
  (cond
   ((number? x) (format #f "#~a" (ash x fixnum-shift)))
   ((boolean? x) (if x true-tag false-tag))
   ((null? x) nil-tag)
   ((char? x) (format #f "#~a" (logior (ash (char->integer x) char-shift) char-tag)))
   (else #f)))

(define (test-check tf)
  (if tf
      (emit "\tbl\ttest_non_zero\n")
      (emit "\tbl\ttest_zero\n")))

(define (test-int val tf)
  (emit "\tmov\t~a, ~a" x0 (compile-exp val))
  (emit "\tbl\tis_fixnum")
  (test-check tf)
  )

(define (test-null val tf)
  (emit "\tmov\t~a, ~a" x0 (compile-exp val))
  (emit "\tbl\tis_null")
  (test-check tf)
  )

(define (test-true val tf)
  (emit "\tmov\t~a, ~a" x0 (compile-exp val))
  (emit "\tbl\tis_true")
  (test-check tf)
  )

(define (test-false val tf)
  (emit "\tmov\t~a, ~a" x0 (compile-exp val))
  (emit "\tbl\tis_false")
  (test-check tf)
  )

(define (test-char val tf)
  (emit "\tmov\t~a, ~a" x0 (compile-exp val))
  (emit "\tbl\tis_char")
  (test-check tf)
  )

(define (compile-tests  file-name)
  (with-output-to-file file-name
    (lambda ()
      (emit-rumi-init)
      (test-int 1 #t)
      (test-int 100 #t)
      (test-int 1234 #t)
      (test-int 142 #t)
      (test-int #t #f)
      (test-true #t #t)
      (test-true #f #f)
      (test-false #f #t)
      (test-false #t #f)
      (test-null '() #t)
      (test-null 5 #f)
      (test-null #\c #f)
      (test-char #\c #t)
      (test-char 1 #f)
      )))

(define (emit-rumi-init)
  (emit "\t.arch armv8-a")
  (emit "\t.file \"rumi.s\"")
  (emit "\t.text")
  (emit "\t.align 2")
  (emit "\t.p2align 4,,11")
  (emit "\t.global scheme_entry")
  (emit "\t.type scheme_entry, %function")
  (add-label "scheme_entry"))

(define (add-label name)
  (emit "~a:" name))

(define (add-global-function f-name)
  (emit ".global ~a" f-name)
  (add-function f-name)
  )

(define (add-gen-f)
  (set! f-name-counter (1+ f-name-counter))
  (add-function f-name-counter)
  f-name-counter)

(define (emit-new-line)
  (emit ""))

(define (comment com)
  (emit "\t//~a" com)
  )

(define (branch-zero val adr)
  (emit "\tcbz\t~a, ~a" val adr)
  )

(define (branch-non-zero val adr)
  (emit "\tcbnz\t~a, ~a" val adr)
  )

(define (spin-lock)
  (let ((f-name (add-gen-f)))
    (comment "cpu spin lock")
    (emit "\twfe")
    (branch f-name)
    (emit-new-line)
    ))

(define (branch f-name)
  (emit "\tb\t~ab" f-name))

(define (val->asm val)
  (cond
   ((number? val) (format #f "#~a" val))))

(define (load-adr reg adr)
  (emit "\tldr\t~a, =~a" reg adr)
  )

(define (set-stack val)
  (comment "set stack")
  (load-adr x1 '_start)
  (emit "\tmov\tsp,x1"))

(define (asm-and des reg2 val)
  (emit "\tand\t~a, ~a, ~a" des reg2 (val->asm val)))

(define (initialize-start)
  (emit ".section \".text.boot\"")
  (add-global-function "_start")
  )

(define (mrs reg val)
  (emit "\tmrs\t~a, ~a" reg val))

(define (emit-program expr)
  (apply expr '())
  )

(define (clear-bss)
  (comment "Clear bss")
  (load-adr x1 '__bss_start)
  (load-adr w2 '__bss_size))
  ;; (emit-program-header)
  ;; (if (letrec? program) (emit-letrec program)
  ;; (emit-scheme-entry expr (make-initial-env '() '())))

(define (emit . c)
  (apply format (cons #t c))
  (format #t "\n"))

;; (define (setup-boot)
;;   )
