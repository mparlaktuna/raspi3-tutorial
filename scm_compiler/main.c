/*
 * Copyright (C) 2018 bzt (bztsrc@github)
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use, copy,
 * modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 */

#include "uart.h"

#define FIXNUM_MASK 0x03
#define FIXNUM_SHIFT 2
#define CHAR_MASK  0x0F
#define CHAR_SHIFT 8

typedef enum {
    LANG_T_BOOLEAN_F = 0x2F,
    LANG_T_BOOLEAN_T = 0x6F,
    LANG_T_FIXNUM    = 0x00,
    LANG_T_NIL       = 0x3F,
    LANG_T_CHAR      = 0x0F,
    LANG_T_CONS      = 0x01,
    LANG_T_VECTOR    = 0x05,
    LANG_T_STRING    = 0x06
} type_e;

typedef unsigned long long ptr;

int is_fixnum(ptr val)
{
     if ((val & FIXNUM_MASK) == LANG_T_FIXNUM) {
       return 1;
    }
    return 0;
}

int is_char(ptr val)
{
  if ((val & CHAR_MASK) == LANG_T_CHAR) {
    return 1;
  }
  return 0;
}

int is_null(ptr val)
{
     if (val == LANG_T_NIL) {
       return 1;
    }
    return 0;
  
}

int is_true(ptr val)
{
     if (val != LANG_T_BOOLEAN_F) {
       return 1;
    }
    return 0;
}

  int is_false(ptr val)
  {
     if (val == LANG_T_BOOLEAN_F) {
       return 1;
    }
    return 0;
}

void test_zero(int s)
{
  if(s == 0)
    {
      uart_puts("Pass!\n");  
    }
  else
    {
      uart_puts("Fail!\n");  
    }
}

void test_non_zero(int s)
{
  if(s != 0)
    {
      uart_puts("Pass!\n");  
    }
  else
    {
      uart_puts("Fail!\n");  
    }
}


extern void scheme_entry();

void main()
{
    uart_init();
    scheme_entry();
}
