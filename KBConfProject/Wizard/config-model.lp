% Test Case Wizard
% Model : 3

%Classes
ooasp_class("3","Object").
ooasp_class("3","Wizard").
ooasp_class("3","Staff").
ooasp_class("3","Robe").
ooasp_class("3","Shoes").



%Subclasses
ooasp_subclass("3","Wizard","Object").
ooasp_subclass("3","Staff","Object").
ooasp_subclass("3","Robe","Object").
ooasp_subclass("3","Shoes","Object").




%Associations

%Staff
ooasp_assoc("3","WizardStaff","Wizard",1,1,"Staff",1,1).

%Robe
ooasp_assoc("3","WizardRobe","Wizard",1,1,"Robe",1,1).

%Shoes
ooasp_assoc("3","WizardShoes","Wizard",1,1,"Shoes",1,1).


%Attributes

%Staff Power
ooasp_attribute("3","Staff","StaffPower","integer").
ooasp_attribute_minInclusive("3","Staff","StaffPower",1).
ooasp_attribute_maxInclusive("3","Staff","StaffPower",10).

%Robe Color
ooasp_attribute("3","Robe","RobeColor","string").
ooasp_attribute_enum("3","Robe","RobeColor","Black").

%Wearing Shoes
ooasp_attribute("3","Shoes","WearingShoes","string").
ooasp_attribute_enum("3","Shoes","WearingShoes","True").
