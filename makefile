
DIR=./javacode
BIN_DIR=-d ${DIR}
EXT_DIRS=-extdirs ${DIR}
CLASS_DIRS=-classpath ${DIR}

ifneq ($(wildcard $(DIR)),${DIR})
$(info creating the directory ${DIR})
$(shell mkdir -p ${DIR})
else
$(info cleaning the directory ${DIR})
$(shell rm -rf ${DIR}/*)
endif

ifeq (${FILE},)
$(info make FILE=file-number)
$(info file-number is one of:\
$(patsubst java-patt.%.java, %, $(wildcard java-patt.*.java)))
$(error missing FILE=...)
else
F=java-patt.${FILE}.java
endif

C=Test

little_java:
	$(info compile $F)
	@javac ${BIN_DIR} ${EXT_DIRS} ${F}
	$(info execute)
	@java ${CLASS_DIRS} ${C}




