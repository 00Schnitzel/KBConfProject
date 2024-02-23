%Hard coded limit for generating
lim(20).


%Generating

%Generate parts
{ ooasp_isa(I,C,G) : G = 1..N } N :- ooasp_instantiation(M,I), ooasp_class(M,C) ,not ooasp_subclass(M,_,C), lim(N).


%generaed possible associations
{ooasp_associated(I,A,O1,O2) : ooasp_isa(I,SC2,O2)} :- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,SC1,O1), ooasp_subclass(M,SC1,C1), ooasp_subclass(M,SC2,C2).
{ooasp_associated(I,A,O1,O2) : ooasp_isa(I,C2,O2)} :- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,C1,O1).
{ooasp_associated(I,A,O1,O2) : ooasp_isa(I,SC2,O2)} :- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,C1,O1), ooasp_subclass(M,SC2,C2).
{ooasp_associated(I,A,O1,O2) : ooasp_isa(I,C2,O2)} :- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,SC1,O1), ooasp_subclass(M,SC1,C1).



%Counting

%count all objects associated to the left side object of the association
numAssoc(I,A,O1,C) :- C = #count{ O2 : ooasp_associated(I,A,O1,O2)}, ooasp_associated(I,A,O1,_).
%count all objects associated to the right side object of the association
numAssoc(I,A,O2,C) :- C = #count{ O1 : ooasp_associated(I,A,O1,O2)}, ooasp_associated(I,A,_,O2).



%Constraint Checking

%Check if every ID occurs only once
:- ooasp_isa(I,C1,O), ooasp_isa(I,C2,O), C1!=C2.


%check for Minimum and Maximum association violations
	%Check for assocs with subclasse
:- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,SC2,O2), ooasp_subclass(M,SC2,C2), numAssoc(I,A,O2,C), C<C1MIN.
:- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,SC1,O1), ooasp_subclass(M,SC1,C1), numAssoc(I,A,O1,C), C<C2MIN.
:- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,SC2,O2), ooasp_subclass(M,SC2,C2), numAssoc(I,A,O2,C), C>C1MAX.
:- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,SC1,O1), ooasp_subclass(M,SC1,C1), numAssoc(I,A,O1,C), C>C2MAX.
	%check for assocs with classes
:- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,C2,O2), numAssoc(I,A,O2,C), C<C1MIN.
:- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,C1,O1), numAssoc(I,A,O1,C), C<C2MIN.
:- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,C2,O2), numAssoc(I,A,O2,C), C>C1MAX.
:- ooasp_instantiation(M,I), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,C1,O1), numAssoc(I,A,O1,C), C>C2MAX.


%Check that every object is in an association if possible

%Check that every side of an association is connected to a counterpart unless the other side can be empty (C_MIN=0) 
:- ooasp_isa(I,SC1,O1), not ooasp_associated(I,A,O1,_), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_subclass(M,SC1,C1), not C2MIN=0.
:- ooasp_isa(I,C1,O1), not ooasp_associated(I,A,O1,_), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), not C2MIN=0.
:- ooasp_isa(I,SC2,O2), not ooasp_associated(I,A,_,O2), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_subclass(M,SC2,C2), not C1MIN=0.
:- ooasp_isa(I,C2,O2), not ooasp_associated(I,A,_,O2), ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), not C1MIN=0.

%Check if both sides of an association are connected, if they exist
	%check for the left side if there are possible connections to a right side
:- ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,SC1,O1), ooasp_isa(I,SC2,O2), ooasp_subclass(M,SC1,C1), ooasp_subclass(M,SC2,C2), not ooasp_associated(I,A,O1,_).
:- ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,C1,O1), ooasp_isa(I,SC2,O2), ooasp_subclass(M,SC2,C2), not ooasp_associated(I,A,O1,_).
:- ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,SC1,O1), ooasp_isa(I,C2,O2), ooasp_subclass(M,SC1,C1), not ooasp_associated(I,A,O1,_).
:- ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,C1,O1), ooasp_isa(I,C2,O2), not ooasp_associated(I,A,O1,_).
	%check for the right side if there are possible connections to a left side
:- ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,SC1,O1), ooasp_isa(I,SC2,O2), ooasp_subclass(M,SC1,C1), ooasp_subclass(M,SC2,C2), not ooasp_associated(I,A,_,O2).
:- ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,C1,O1), ooasp_isa(I,SC2,O2), ooasp_subclass(M,SC2,C2), not ooasp_associated(I,A,_,O2).
:- ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,SC1,O1), ooasp_isa(I,C2,O2), ooasp_subclass(M,SC1,C1), not ooasp_associated(I,A,_,O2).
:- ooasp_assoc(M,A,C1,C1MIN,C1MAX,C2,C2MIN,C2MAX), ooasp_isa(I,C1,O1), ooasp_isa(I,C2,O2), not ooasp_associated(I,A,_,O2).


%Check that Atttirbute values are correct
	%Check for Classes
:- ooasp_instantiation(M,I), ooasp_attribute_enum(M,C,AT,VAL1), ooasp_isa(I,C,O), ooasp_attribute_value(I,AT,O,VAL2),  not VAL1=VAL2.
:- ooasp_attribute_value(I,AT,O,VAL), ooasp_isa(I,C,O), ooasp_attribute_minInclusive(I,C,AT,MIN), ooasp_attribute_maxInclusive(I,C,AT,MAX), VAL<MIN.
:- ooasp_attribute_value(I,AT,O,VAL), ooasp_isa(I,C,O), ooasp_attribute_minInclusive(I,C,AT,MIN), ooasp_attribute_maxInclusive(I,C,AT,MAX), VAL>MAX.
	%Check for subclasses
:- ooasp_instantiation(M,I), ooasp_attribute_enum(M,C,AT,VAL1), ooasp_subclass(M,SC,C), ooasp_isa(I,SC,O), ooasp_attribute_value(I,AT,O,VAL2),  not VAL1=VAL2.
:- ooasp_attribute_value(I,AT,O,VAL), ooasp_subclass(M,SC,C), ooasp_isa(I,SC,O), ooasp_attribute_minInclusive(M,C,AT,MIN), ooasp_attribute_maxInclusive(M,C,AT,MAX), VAL<MIN.
:- ooasp_attribute_value(I,AT,O,VAL), ooasp_subclass(M,SC,C), ooasp_isa(I,SC,O), ooasp_attribute_minInclusive(M,C,AT,MIN), ooasp_attribute_maxInclusive(M,C,AT,MAX), VAL>MAX.



%Minimizing

%Minimize number of components used
#minimize {1, O : ooasp_isa(I,C,O)}.


%Show Statements

#show ooasp_instantiation/2.
#show ooasp_isa/3.
#show ooasp_associated/4.
#show ooasp_attribute_value/4.