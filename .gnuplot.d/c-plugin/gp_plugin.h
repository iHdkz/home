#include <complex.h>
#define HAVE_STDBOOL_H 1
#include <gp_types.h>

#ifdef WIN32
# define DLLEXPORT __declspec(dllexport)
# define __inline__ __inline
#else
# define DLLEXPORT
#endif

//typedef DLLEXPORT struct value (*GP_TYPE)(int, struct value*, void*);

/* prototype for a plugin function */
DLLEXPORT void *gnuplot_init(struct value(*)(int, struct value *, void *));
DLLEXPORT void gnuplot_fini(void *);

/* Check that the number of parameters declared in the gnuplot import
 * statement matches the actual number of parameters in the exported
 * function
 */
#define RETURN_ERROR_IF_WRONG_NARGS(r, nargs, ACTUAL_NARGS) \
    if (nargs != ACTUAL_NARGS) { \
	r.type = INVALID_VALUE;  \
	return r; \
    }

#define RETURN_ERROR_IF_NONNUMERIC(r, arg) \
    if (arg.type != CMPLX && arg.type != INTGR) { \
	r.type = INVALID_VALUE; \
	return r; \
    }

#define VALUE_ASSIGN(/* struct value */ r, /* complex double */ c) \
	do { \
		r.v.cmplx_val.real = creal(c); \
		r.v.cmplx_val.imag = cimag(c); \
	} while(0)

__inline__ static double RVAL(struct value v)
{
  if (v.type == CMPLX)
    return v.v.cmplx_val.real;
  else if (v.type == INTGR)
    return (double) v.v.int_val;
  else
    return 0;	/* precluded by sanity check above */
}

__inline__ static int IVAL(struct value v)
{
  if (v.type == CMPLX)
    return (int)v.v.cmplx_val.real;
  else if (v.type == INTGR)
    return v.v.int_val;
  else
    return 0;	/* precluded by sanity check above */
}

__inline__ static complex double CMPLXVAL(struct value v)
{
  if (v.type == CMPLX)
    return CMPLX(v.v.cmplx_val.real,v.v.cmplx_val.imag);
  else if (v.type == INTGR)
    return CMPLX( (double) v.v.int_val, 0.0);
  else
    return 0;	/* precluded by sanity check above */
}

#define DEFINE_GPFUNC_INT(FNAME_INT,NUMERIC_FUNC) \
DLLEXPORT struct value FNAME_INT(int nargs, struct value *arg, void *p) \
{ \
  struct value result; result.type = INTGR; \
  RETURN_ERROR_IF_WRONG_NARGS(result, nargs, 1);\
  RETURN_ERROR_IF_NONNUMERIC(result, arg[0]); \
  result.v.int_val = NUMERIC_FUNC(IVAL(arg[0])); \
  return result; \
}

#define DEFINE_GPFUNC_C(FNAME_C, NUMERIC_FUNC) \
DLLEXPORT struct value FNAME_C(int nargs, struct value *arg, void *p) \
{ \
  struct value result; result.type = CMPLX; \
  RETURN_ERROR_IF_WRONG_NARGS(result, nargs, /* arity */ 1); \
  RETURN_ERROR_IF_NONNUMERIC(result, arg[0]); \
  double complex c = CMPLXVAL(arg[0]); \
  VALUE_ASSIGN( result, NUMERIC_FUNC(c) ); \
  return result; \
}

#define DEFINE_GPFUNC_CC(FNAME_CC, NUMERIC_FUNC) \
DLLEXPORT struct value FNAME_CC(int nargs, struct value *arg, void *p) \
{ \
  struct value result; result.type = CMPLX; \
  RETURN_ERROR_IF_WRONG_NARGS(result, nargs, /* arity */ 2); \
  RETURN_ERROR_IF_NONNUMERIC(result, arg[0]); \
  RETURN_ERROR_IF_NONNUMERIC(result, arg[1]); \
  double complex c0 = CMPLXVAL(arg[0]); \
  double complex c1 = CMPLXVAL(arg[1]); \
  VALUE_ASSIGN( result, NUMERIC_FUNC(c0, c1) ); \
  return result; \
}

#define DEFINE_GPFUNC_CCC(FNAME_CCC, NUMERIC_FUNC) \
DLLEXPORT struct value FNAME_CCC(int nargs, struct value *arg, void *p) \
{ \
  struct value result; result.type = CMPLX; \
  RETURN_ERROR_IF_WRONG_NARGS(result, nargs, /* arity */ 3); \
  RETURN_ERROR_IF_NONNUMERIC(result, arg[0]); \
  RETURN_ERROR_IF_NONNUMERIC(result, arg[1]); \
  RETURN_ERROR_IF_NONNUMERIC(result, arg[2]); \
  double complex c0 = CMPLXVAL(arg[0]); \
  double complex c1 = CMPLXVAL(arg[1]); \
  double complex c2 = CMPLXVAL(arg[2]); \
  VALUE_ASSIGN( result, NUMERIC_FUNC(c0, c1, c2) ); \
  return result; \
}

#undef NaN
