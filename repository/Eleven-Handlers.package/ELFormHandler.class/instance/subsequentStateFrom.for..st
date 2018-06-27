form handling
subsequentStateFrom: formState for: request
	"Subclasses may override this method to modify the form state (for rendering after it has been submitted). This method should not alter the original formState! It should return a copy or a new instance instead if it needs to perform any modifications."
	
	^ formState