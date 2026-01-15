
#include "box2d/base.h"

/* this is a hack so that the generated static library contains the "inlined" procedures.
   i'm not sure how else to make these procedures available to languages other than c/c++

   i know you can use extern declaration in an object file in gcc and clang, but that doesn't work in msvc
*/
#undef B2_INLINE
#define B2_INLINE B2_API

#include "box2d/box2d.h"
#include "box2d/collision.h"
#include "box2d/id.h"
#include "box2d/math_functions.h"
#include "box2d/types.h"
