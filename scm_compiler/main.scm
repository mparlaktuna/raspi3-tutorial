(add-to-load-path (dirname (current-filename)))
(format #t "Compiling rumi.scm\n")

(use-modules (compiler arm64))
(use-modules (ice-9 textual-ports))
(compile-tests "rumi.s")



