!classDefinition: #OneHundredDoorsTest category: 'OneHundredDoors-Test'!
TestCase subclass: #OneHundredDoorsTest
	instanceVariableNames: 'aNewDoor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OneHundredDoors-Test'!

!OneHundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 12:29:10'!
setUp

	aNewDoor := Door new! !

!OneHundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 13:38:08'!
testThatANewRowHasDoorsClosed
	| aTenDoorsRow aThreeDoorsRow |
	
	aThreeDoorsRow := Row withDoors: 3.
	aTenDoorsRow := Row withDoors: 10.	
	
	Assert that: aThreeDoorsRow asString isEqualTo: '###'.
	Assert that: aTenDoorsRow asString isEqualTo: '##########'.! !

!OneHundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 13:31:04'!
testThatClosedDoorsPrintTheNumeralCharacter
	
	|aClosedDoor|
	aClosedDoor := Door closed.
	Assert that: aClosedDoor asCharacter isEqualTo: '#'.! !

!OneHundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 12:42:55'!
testThatClosedStateIsClosedAndNotOpen
	
	|aClosedState|
	aClosedState := Closed new.
	Assert isTrue: aClosedState isClosed.
	Assert isFalse: aClosedState isOpen.! !

!OneHundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 12:45:53'!
testThatNewDoorToggleStateAndIsOpen
	aNewDoor toggle.
	Assert isFalse: aNewDoor isClosed.
	Assert isTrue: aNewDoor isOpen.! !

!OneHundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 12:46:04'!
testThatNewDoorsAreClosed
	Assert isTrue: aNewDoor isClosed.
	Assert isFalse: aNewDoor isOpen.! !

!OneHundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 12:46:17'!
testThatNewDoorsAreToggledTwice
	aNewDoor toggle;
			 toggle.
	Assert isTrue: aNewDoor isClosed.
	Assert isFalse: aNewDoor isOpen.! !

!OneHundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 12:39:09'!
testThatOpenDoorsPrintTheAtCharacter
	
	|anOpenDoor|
	anOpenDoor := Door open.
	Assert that: anOpenDoor asCharacter isEqualTo: '@'.! !

!OneHundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 12:44:18'!
testThatOpenStateIsOpenAndNotClosed
	
	|anOpenState|
	anOpenState := Open new.
	Assert isFalse: anOpenState isClosed.
	Assert isTrue: anOpenState isOpen.! !

!OneHundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 14:30:54'!
testThatWeCannotCreateANegativeNumberDoorRow
	Assert should: [ Row withDoors: -5 ] signal: Error withDescription: (Row messageOfInvalidQuantity: -5).! !

!OneHundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 14:32:22'!
testThatWeCannotCreateAZeroDoorRow
	Assert should: [ Row withDoors: 0 ] signal: Error withDescription: (Row messageOfInvalidQuantity: 0).! !

!OneHundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 14:41:15'!
testThatWeCannotToggleEveryZero
	| aFourDoorsRow |
	aFourDoorsRow := Row withDoors: 4.
	Assert should: [aFourDoorsRow toggleEvery: 0] signal: Error  withDescription: (aFourDoorsRow notValidEveryDoorNumberMessage: 0)! !

!OneHundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 13:55:15'!
testThatWeClosedEveryDoor
	| aThirteenDoorsRow |
	aThirteenDoorsRow := Row withDoors: 13.	
	aThirteenDoorsRow toggleEvery: 1.
	Assert that: aThirteenDoorsRow asString isEqualTo: '@@@@@@@@@@@@@'.! !

!OneHundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 14:02:35'!
testThatWeMakeAllPassesOfTheRow
	| aSixDoorsRow |
	aSixDoorsRow := Row withDoors: 6.	
	aSixDoorsRow doAllPasses.
	Assert that: aSixDoorsRow asString isEqualTo: '@##@##'.
	
	! !

!OneHundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 14:04:23'!
testThatWeToggleOnlyTheLastDoor
	| aFourteenDoorsRow |
	aFourteenDoorsRow := Row withDoors: 14.	
	aFourteenDoorsRow toggleEvery: 14.
	Assert that: aFourteenDoorsRow asString isEqualTo: '#############@'.! !

!OneHundredDoorsTest methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 13:55:48'!
testThatWeToggleSomeDoors
	| aFifteenDoorsRow aSevenDoorsRow |
	aFifteenDoorsRow := Row withDoors: 15.	
	aSevenDoorsRow := Row withDoors: 7.
	
	aFifteenDoorsRow toggleEvery: 2.
	
	aSevenDoorsRow toggleEvery: 1.
	aSevenDoorsRow toggleEvery: 3.
	
	Assert that: aFifteenDoorsRow asString isEqualTo: '#@#@#@#@#@#@#@#'.
	Assert that: aSevenDoorsRow asString isEqualTo: '@@#@@#@'.! !
