package org.pachinko.exception;

public class InvalidNoException extends PCKRuntimeException {

    public InvalidNoException(ExceptionEnum exceptionEnum) {
        super(exceptionEnum);
    }

}
