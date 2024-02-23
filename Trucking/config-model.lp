% Test Case Trucking
% Model : 1

%Classes
ooasp_class("1","Object").
ooasp_class("1","Company").
ooasp_class("1","Garage").
ooasp_class("1","Truck"). 
ooasp_class("1","Trailer").
ooasp_class("1","Scania").
ooasp_class("1","Volvo"). 
ooasp_class("1","LowBed").
ooasp_class("1","DryFreighter"). 


%Subclasses
ooasp_subclass("1","Company","Object").
ooasp_subclass("1","Garage","Object").
ooasp_subclass("1","Truck","Object").
ooasp_subclass("1","Trailer","Object").

ooasp_subclass("1","Scania","Truck").
ooasp_subclass("1","Volvo","Truck").
ooasp_subclass("1","LowBed","Trailer").
ooasp_subclass("1","DryFreighter","Trailer").


%Associations

%Company
ooasp_assoc("1","CompanyGarage","Company",1,1,"Garage",1,5).

%Garage
ooasp_assoc("1","GarageTruck","Garage",1,1,"Truck",0,5).

%Truck
ooasp_assoc("1","TruckTrailer","Truck",1,1,"Trailer",1,1).