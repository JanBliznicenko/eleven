attributes
buildStyleAttribute
	^ (self styles associations collect: [ :assoc |
			assoc key , ': ' , assoc value asString ])
				joinUsing: '; '