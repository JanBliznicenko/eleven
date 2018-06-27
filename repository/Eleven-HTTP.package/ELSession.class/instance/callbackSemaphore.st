private - atomicity
callbackSemaphore
	^ callbackSemaphore ifNil: [
			callbackSemaphore := Semaphore forMutualExclusion ]