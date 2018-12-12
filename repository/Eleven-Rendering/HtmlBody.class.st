Class {
	#name : #HtmlBody,
	#superclass : #ELContainerHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #events }
HtmlBody >> onAfterPrint: aBlock [
	^ self on: #afterprint do: aBlock
]

{ #category : #events }
HtmlBody >> onBeforePrint: aBlock [
	^ self on: #beforeprint do: aBlock
]

{ #category : #events }
HtmlBody >> onBeforeUnload: aBlock [
	^ self on: #beforeunload do: aBlock
]

{ #category : #events }
HtmlBody >> onHashChange: aBlock [
	^ self on: #hashchange do: aBlock
]

{ #category : #events }
HtmlBody >> onMessage: aBlock [
	^ self on: #message do: aBlock
]

{ #category : #events }
HtmlBody >> onOffline: aBlock [
	^ self on: #offline do: aBlock
]

{ #category : #events }
HtmlBody >> onOnline: aBlock [
	^ self on: #online do: aBlock
]

{ #category : #events }
HtmlBody >> onPageHide: aBlock [
	^ self on: #pagehide do: aBlock
]

{ #category : #events }
HtmlBody >> onPageShow: aBlock [
	^ self on: #pageshow do: aBlock
]

{ #category : #events }
HtmlBody >> onPopState: aBlock [
	^ self on: #popstate do: aBlock
]

{ #category : #events }
HtmlBody >> onResize: aBlock [
	^ self on: #resize do: aBlock
]

{ #category : #events }
HtmlBody >> onStorage: aBlock [
	^ self on: #storage do: aBlock
]

{ #category : #events }
HtmlBody >> onUnload: aBlock [
	^ self on: #unload do: aBlock
]

{ #category : #accessing }
HtmlBody >> tagName [
	^ #body
]
