;; /// @file accumulate_u8.cpp
;; #include <emscripten.h> // macro EMSCRIPTEN_KEEPALIVE
;; #include <stdint.h>
;; #include <vector>
;; #include <numeric>
;; extern "C" {
;; int32_t EMSCRIPTEN_KEEPALIVE accumulate_u8(const int32_t arlen, const uint8_t *ar) {
;;    int32_t arsum = 0;
;;    for (int32_t i=0; i<arlen; ++i)
;; 	arsum += (int32_t) ar[i];
;;    return arsum;
;; }
;; } // extern "C"
(module
 (type $0 (func (param i32 i32) (result i32)))
 (type $1 (func))
 (import "env" "memoryBase" (global $import$0 i32))
 (import "env" "memory" (memory $0 256))
 (import "env" "table" (table 0 funcref))
 (import "env" "tableBase" (global $import$3 i32))
 (global $global$0 (mut i32) (i32.const 0))
 (global $global$1 (mut i32) (i32.const 0))
 (export "__post_instantiate" (func $2))
 (export "_accumulate_u8" (func $0))
 (func $0 (type $0) (param $var$0 i32) (param $var$1 i32) (result i32)
  (local $var$2 i32)
  (local $var$3 i32)
  (block $label$0 (result i32)
   (if
    (i32.gt_s
     (local.get $var$0)
     (i32.const 0)
    )
    (then
     (local.set $var$2
     (i32.const 0)
    )
     (local.set $var$3
      (i32.const 0)
     )
    )
    (else
     (return
     (i32.const 0)
     )
    )
   )
   (loop $label$3
    (local.set $var$3
     (i32.add
      (i32.load8_u
       (i32.add
        (local.get $var$1)
        (local.get $var$2)
       )
      )
      (local.get $var$3)
     )
    )
    (br_if $label$3
     (i32.ne
      (local.tee $var$2
       (i32.add
        (local.get $var$2)
        (i32.const 1)
       )
      )
      (local.get $var$0)
     )
    )
   )
   (local.get $var$3)
  )
 )
 (func $1 (type $1)
  (nop)
 )
 (func $2 (type $1)
  (block $label$0
   (global.set $global$0
    (global.get $import$0)
   )
   (global.set $global$1
    (i32.add
     (global.get $global$0)
     (i32.const 5242880)
    )
   )
   (call $1)
  )
 )
 ;; custom section "dylink", size 5
)
