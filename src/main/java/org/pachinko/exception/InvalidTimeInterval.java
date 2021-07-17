package org.pachinko.exception;

public class InvalidTimeInterval extends PCKRuntimeException {

    public InvalidTimeInterval(ExceptionEnum exceptionEnum) {
        super(exceptionEnum);
    }

}
