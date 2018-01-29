RPN_SRCS = UAC.rpn WKA.rpn TIMER.rpn DWD.rpn REM.rpn HOURS.rpn NOTES.rpn CRYPT.rpn EVAL.rpn FINANCE.rpn EASTER.rpn FILEMAN.rpn FILE.rpn LIBXM.rpn LIBHPX.rpn DMD.rpn RNG.rpn
RPN_RAWS =
ASM_SRCS = header.s ISENE_support.s

OBJS = $(RPN_SRCS:%.rpn=%.o) $(RPN_RAWS:%.raw=%.o) $(ASM_SRCS:%.s=%.o)

MOD = ISENE.mod

all:	$(MOD)

clean:
	-rm -f ${OBJS} *.lst $(MOD)

%.o: %.rpn
	rpncomp -l -I../module-descriptor $<

%.o: %.raw
	rpncomp -l -I../module-descriptor $<

%.o: %.s
	asnut $<

$(MOD): $(OBJS) ISENE.scm ISENE.moddesc Makefile
	lnnut -l $(OBJS) ISENE.scm ISENE.moddesc --no-list-header -o $(MOD)
