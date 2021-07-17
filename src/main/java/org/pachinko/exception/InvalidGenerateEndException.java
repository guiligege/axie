package org.pachinko.exception;

public class InvalidGenerateEndException extends PCKRuntimeException {

    public InvalidGenerateEndException(ExceptionEnum exceptionEnum) {
        super(exceptionEnum);
    }

}
