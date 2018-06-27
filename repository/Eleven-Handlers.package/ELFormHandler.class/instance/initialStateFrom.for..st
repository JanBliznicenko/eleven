form handling
initialStateFrom: formState for: request
	"Subclasses may override this method to provide the initial form state (for rendering before it is submitted for the first time). This method should not alter the original formState! It should return a copy or a new instance instead if it needs to perform any modifications."
	
	^ formState