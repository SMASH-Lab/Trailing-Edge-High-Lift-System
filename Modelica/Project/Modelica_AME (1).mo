package Modelica_AME ""
 
	 
	 
	 
	 
	model In_Out ""
		 
		 
		 
		LMS.Blocks.Math.Sum sum
				annotation (Placement(transformation(origin={-2.7, 40.1}, extent={{-10, -10}, {10, 10}})));
		LMS.AMESim.Blocks.SignalToAMESim signaltoamesim_1
				annotation (Placement(transformation(origin={65.4, 39.3}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim signalfromamesim_1
				annotation (Placement(transformation(origin={-70.1, 55.2}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim signalfromamesim_2
				annotation (Placement(transformation(origin={-70.6, -28.1}, extent={{-12, -10}, {12, 10}})));
		 
		 
		 
		 
		 
		 
		 
		 
		 
		annotation(Diagram(coordinateSystem(extent={{-100, -100}, {100, 100}})));
	equation
		 connect(signalfromamesim_1.outport, sum.u2)
		annotation(Line(visible=true, points={{-60, 55.2}, {-55, 55.2}, {-55, 44.1}, {-12.7, 44.1}}, thickness=0.25));
		connect(signalfromamesim_2.outport, sum.u1)
		annotation(Line(visible=true, points={{-12.7, 36.1}, {-41.5, 36.1}, {-41.5, -28.1}, {-60.6, -28.1}}, thickness=0.25));
		connect(sum.y, signaltoamesim_1.inport)
		annotation(Line(visible=true, points={{7.3, 40.1}, {55.4, 40.1}, {55.4, 39.3}}, thickness=0.25));
		   
	
	end In_Out;
	 
	 
       
	 
       
	model MSD2 ""
         Modelica.Blocks.Sources.Sine sine(amplitude=10)
            annotation (Placement(transformation(origin={-78.8, 2.42}, extent={{-10, -10}, {10, 10}})));
         Modelica.Mechanics.Translational.Sources.Force force
            annotation (Placement(transformation(origin={-38.8, 2.42}, extent={{-10, -10}, {10, 10}})));
         Modelica.Mechanics.Translational.Components.Mass mass1(m=1)
            annotation (Placement(transformation(origin={1.19, 2.42}, extent={{-10, -10}, {10, 10}})));
         Modelica.Mechanics.Translational.Components.SpringDamper SD1(c=1, s_rel0=0, d=0.1)
            annotation (Placement(transformation(origin={41.2, 2.42}, extent={{-10, -10}, {10, 10}})));
         VelInputForceOutput adapter
            annotation (Placement(transformation(origin={81.2, 2.42}, extent={{-12, -10}, {12, 10}})));
	equation
		connect(SD1.flange_b, adapter.flange_a)
		annotation(Line(visible=true, points={{51.2, 2.42}, {71.2, 2.42}}, thickness=0.25));
		connect(mass1.flange_b, SD1.flange_a)
		annotation(Line(visible=true, points={{11.2, 2.42}, {31.2, 2.42}}, thickness=0.25));
		connect(force.flange, mass1.flange_a)
		annotation(Line(visible=true, points={{-28.8, 2.42}, {-8.81, 2.42}}, thickness=0.25));
		connect(sine.y, force.f)
		annotation(Line(visible=true, points={{-67.8, 2.42}, {-50.8, 2.42}}, thickness=0.25));
		annotation(Diagram(coordinateSystem(extent={{-100, -100}, {100, 100}})));
	
	end MSD2;
   	 
model test_MaxRising ""
		Modelica_Requirements.ChecksInFixedWindow.MaxRising maxrising(check = check.y, nRisingMax=3)
				annotation (Placement(transformation(origin={8.01, 16.8}, extent={{-23, -12.3}, {23, 12.3}})));
		Modelica.Blocks.Sources.BooleanTable condition(table={1, 2, 3, 3.5, 4})
				annotation (Placement(transformation(origin={-52.1, 17.1}, extent={{-10, -10}, {10, 10}})));
		Modelica.Blocks.Sources.BooleanTable check(startValue=true, table={0.2, 0.3, 0.4, 1.1, 1.2, 1.3, 1.4, 2.2, 2.5, 3.1, 3.15, 3.2, 3.25, 3.3, 3.35, 3.4, 3.45})
				annotation (Placement(transformation(origin={-52.9, -22.2}, extent={{-10, -10}, {10, 10}})));
		 
	equation
		connect(maxrising.condition, condition.y)
		annotation(Line(visible=true, points={{-17.3, 16.9}, {-39.5, 16.9}, {-39.5, 17.1}, {-41.1, 17.1}}, thickness=0.25)); 
		annotation(Diagram(coordinateSystem(extent={{-100, -100}, {100, 100}})));
	
	end test_MaxRising;
model Constant ""
		 
		Modelica.Blocks.Sources.Step step(height=10, startTime=5)
				annotation (Placement(transformation(origin={-63.5, -20.7}, extent={{-10, -10}, {10, 10}})));
		 
		LMS.AMESim.Blocks.SignalToAMESim signaltoamesim_1
				annotation (Placement(transformation(origin={68.5, -20.6}, extent={{-12, -10}, {12, 10}})));
       
		LMS.AMESim.Blocks.SignalToAMESim signaltoamesim_2
				annotation (Placement(transformation(origin={34.4, 29.5}, extent={{-12, -10}, {12, 10}})));
		Modelica_Requirements.LogicalBlocks.BooleanToReal booleantoreal
				annotation (Placement(transformation(origin={-14.8, 29.3}, extent={{-10, -10}, {10, 10}})));
		Modelica.Blocks.Sources.BooleanExpression booleanexpression(y=false)
				annotation (Placement(transformation(origin={-53.8, 29.4}, extent={{-10, -10}, {10, 10}})));
		Modelica_Requirements.LogicalBlocks.WithinBand withinband (u_max = 15, u_min = 5)
				annotation (Placement(transformation(origin={-10.3, -20.7}, extent={{-20, -10}, {20, 10}})));
		Modelica_Requirements.LogicalBlocks.BooleanToReal booleantoreal_1
				annotation (Placement(transformation(origin={36.9, -20.8}, extent={{-10, -10}, {10, 10}})));
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		annotation(Diagram(coordinateSystem(extent={{-100, -100}, {100, 100}})));
	equation
		 connect(booleantoreal.y, signaltoamesim_2.inport)
		annotation(Line(visible=true, points={{24.4, 29.5}, {10, 29.5}, {10, 29.3}, {-8.8, 29.3}}, thickness=0.25));
		connect(booleanexpression.y, booleantoreal.u)
		annotation(Line(visible=true, points={{-49, 29.4}, {-46.4, 29.4}, {-46.4, 29.3}, {-21.8, 29.3}}, thickness=0.25));
		connect(booleanexpression.y, booleantoreal.u)
		annotation(Line(visible=true, points={{-42.8, 29.4}, {-41, 29.4}, {-41, 29.3}, {-21.8, 29.3}}, thickness=0.25));
		connect(step.y, withinband.u)
		annotation(Line(visible=true, points={{-52.5, -20.7}, {-47.5, -20.7}, {-47.5, -20.7}, {-32.3, -20.7}}, thickness=0.25));
		connect(withinband.y, booleantoreal_1.u)
		annotation(Line(visible=true, points={{10.7, -20.7}, {20.5, -20.7}, {20.5, -20.8}, {29.9, -20.8}}, thickness=0.25));
		connect(booleantoreal_1.y, signaltoamesim_1.inport)
		annotation(Line(visible=true, points={{42.9, -20.8}, {45.5, -20.8}, {45.5, -20.6}, {58.5, -20.6}}, thickness=0.25));            
	
	end Constant;
	model req_positioning ""
		Modelica_Requirements.ChecksInFixedWindow.During during(check = withinband_1.y)
				annotation (Placement(transformation(origin={13.5, 47.5}, extent={{-20, -10}, {20, 10}})));
		Modelica_Requirements.LogicalBlocks.WithinBand withinband(u_max=15, u_min=5)
				annotation (Placement(transformation(origin={-42.1, 47.5}, extent={{-20, -10}, {20, 10}})));
		Modelica_Requirements.LogicalBlocks.WithinBand withinband_1(u_max=15, u_min=5)
				annotation (Placement(transformation(origin={-40.1, -10.7}, extent={{-20, -10}, {20, 10}})));
		 
		 
		 
		 
		LMS.AMESim.Blocks.SignalToAMESim signaltoamesim
				annotation (Placement(transformation(origin={97.5, 47.3}, extent={{-12, -10}, {12, 10}})));
		 
		Modelica.Blocks.Sources.Step step(height=10, startTime=4)
				annotation (Placement(transformation(origin={-114, 47.6}, extent={{-10, -10}, {10, 10}})));
		Modelica.Blocks.Sources.Step step_1(height=10, startTime=6)
				annotation (Placement(transformation(origin={-115, -10.6}, extent={{-10, -10}, {10, 10}})));
		Modelica_Requirements.LogicalBlocks.PropertyToReal propertytoreal
				annotation (Placement(transformation(origin={63.8, 47.4}, extent={{-10, -10}, {10, 10}})));
		 
		 
		 
		 
		 
		 
		 
		 
		 
		annotation(Diagram(coordinateSystem(extent={{-150, -100}, {150, 100}})));
	equation
		  connect(withinband.y, during.condition)
		annotation(Line(visible=true, points={{-8.5, 47.6}, {-16, 47.6}, {-16, 47.5}, {-21.1, 47.5}}, thickness=0.25)); 
		connect(step.y, withinband.u)
		annotation(Line(visible=true, points={{-64.1, 47.5}, {-98.6, 47.5}, {-98.6, 47.6}, {-103, 47.6}}, thickness=0.25));
		connect(step_1.y, withinband_1.u)
		annotation(Line(visible=true, points={{-104, -10.6}, {-99, -10.6}, {-99, -10.7}, {-62.1, -10.7}}, thickness=0.25));
		connect(during.y, propertytoreal.u)
		annotation(Line(visible=true, points={{34.5, 47.5}, {40, 47.5}, {40, 47.4}, {56.8, 47.4}}, thickness=0.25));
		connect(propertytoreal.y, signaltoamesim.inport)
		annotation(Line(visible=true, points={{87.5, 47.3}, {74, 47.3}, {74, 47.4}, {69.8, 47.4}}, thickness=0.25));         
	
	end req_positioning;
 
model req_Fm_Da_table ""
	Modelica.Blocks.Sources.TimeTable timetable(table=[0, 0; 1, 1; 2, 2; 3, 3; 4, 4; 5, 5; 6, 6; 7, 7; 8, 8; 9, 9; 10, 10])
			annotation (Placement(transformation(origin={-75, 19.9}, extent={{-10, -10}, {10, 10}})));
		LMS.AMESim.Blocks.SignalToAMESim signaltoamesim
				annotation (Placement(transformation(origin={2.11, 20.1}, extent={{-12, -10}, {12, 10}})));
		annotation(Diagram(coordinateSystem(extent={{-100, -100}, {100, 100}})));
	equation
		connect(timetable.y, signaltoamesim.inport)
		annotation(Line(visible=true, points={{-64, 19.9}, {-56.6, 19.9}, {-56.6, 20}, {-7.89, 20}}, thickness=0.25));
	
	end req_Fm_Da_table;
 
 
 
model test_AME_Input ""

		Modelica_Requirements.ChecksInFixedWindow.During during(check = check.y)
				annotation (Placement(transformation(origin={4.67, 37.5}, extent={{-20, -10}, {20, 10}})));
		Modelica_Requirements.LogicalBlocks.WithinBand condition(u_max=15, u_min=4)
				annotation (Placement(transformation(origin={-54.8, 47.5}, extent={{-20, -10}, {20, 10}})));
		Modelica_Requirements.LogicalBlocks.WithinBand check(u_max=15, u_min=4)
				annotation (Placement(transformation(origin={-40.1, -10.7}, extent={{-20, -10}, {20, 10}})));
		 
		 
		 
		 
		LMS.AMESim.Blocks.SignalToAMESim signaltoamesim
				annotation (Placement(transformation(origin={81.6, 37.3}, extent={{-12, -10}, {12, 10}})));
		 
		Modelica.Blocks.Sources.Step step(height=10, startTime=4)
				annotation (Placement(transformation(origin={-117, 62}, extent={{-10, -10}, {10, 10}})));
		Modelica.Blocks.Sources.Step step_1(height=10, startTime=6)
				annotation (Placement(transformation(origin={-79.9, 10.7}, extent={{-10, -10}, {10, 10}})));
		Modelica_Requirements.LogicalBlocks.PropertyToReal propertytoreal
				annotation (Placement(transformation(origin={51.1, 37.4}, extent={{-10, -10}, {10, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim signalfromamesim
				annotation (Placement(transformation(origin={-115, 25.4}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim signalfromamesim_1
				annotation (Placement(transformation(origin={-114, -11}, extent={{-12, -10}, {12, 10}})));
		 
		 
		 
		 
		 
		 
		 
		 
		 
		annotation(Diagram(coordinateSystem(extent={{-150, -100}, {150, 100}})));
	equation
		  connect(condition.y, during.condition)
		annotation(Line(visible=true, points={{-17.3, 37.6}, {-26.6, 37.6}, {-26.6, 47.5}, {-33.8, 47.5}}, thickness=0.25)); 
		connect(during.y, propertytoreal.u)
		annotation(Line(visible=true, points={{25.7, 37.5}, {40, 37.5}, {40, 37.4}, {44.1, 37.4}}, thickness=0.25));
		connect(propertytoreal.y, signaltoamesim.inport)
		annotation(Line(visible=true, points={{71.7, 37.3}, {67.2, 37.3}, {67.2, 37.4}, {57.1, 37.4}}, thickness=0.25));
		connect(signalfromamesim.outport, condition.u)
		annotation(Line(visible=true, points={{-76.8, 47.5}, {-100, 47.5}, {-100, 25.4}, {-105, 25.4}}, thickness=0.25));
		connect(signalfromamesim_1.outport, check.u)
		annotation(Line(visible=true, points={{-62.1, -11}, {-91.9, -11}, {-91.9, -11}, {-104, -11}}, thickness=0.25));         
	

	end test_AME_Input;
 
	 
 
 
model Req_1_OR ""

  Modelica_Requirements.LogicalBlocks.WithinBand X_takeOff(u_max=400, u_min=300) annotation(Placement(visible = true, transformation(origin={49.5, 14.4}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.LogicalBlocks.WithinBand DA_takeOff(u_max = 16, u_min = 14) annotation(Placement(visible = true, transformation(origin={-80, 45.9}, extent={{-20, -10}, {20, 10}})));   
  Modelica_Requirements.ChecksInFixedWindow.During during_takeOff(check = check.y) annotation(Placement(visible = true, transformation(origin={20.2, 45.8}, extent={{-20, -10}, {20, 10}}))); 
 
  Modelica_Requirements.LogicalBlocks.WithinBand X_landing(u_max=700, u_min=650)  annotation(Placement(visible = true, transformation(origin={50.2, -17.6}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.LogicalBlocks.WithinBand DA_landing(u_max = 36, u_min = 34)  annotation(Placement(visible = true, transformation(origin={-80, 8.86}, extent={{-20, -10}, {20, 10}})));
   
		
      LMS.AMESim.Blocks.SignalToAMESim property_takeOff
				annotation (Placement(transformation(origin={105, 45.6}, extent={{-12, -10}, {12, 10}})));
		 
				
		Modelica_Requirements.LogicalBlocks.PropertyToReal propertytoreal
				annotation (Placement(transformation(origin={62.1, 45.7}, extent={{-10, -10}, {10, 10}})));
		 

		LMS.AMESim.Blocks.SignalFromAMESim DA
				annotation (Placement(transformation(origin={-135, 26.5}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim X
				annotation (Placement(transformation(origin={-31.7, 1.13}, extent={{-12, -10}, {12, 10}})));
		Modelica.Blocks.Logical.Or condition
				annotation (Placement(transformation(origin={-24.7, 45.9}, extent={{-10, -10}, {10, 10}})));
		Modelica.Blocks.Logical.Or check
				annotation (Placement(transformation(origin={107, 6.23}, extent={{-10, -10}, {10, 10}})));
		 
      		 
equation
    annotation(uses(Modelica(version = "3.2.1"), Modelica_Requirements(version = "0.10")), experiment(StartTime = 0, StopTime = 6, Tolerance = 1e-06, Interval = 0.012), Diagram(coordinateSystem(extent={{-150, -100}, {150, 100}})));
		connect(property_takeOff.inport, propertytoreal.y)
		annotation(Line(visible=true, points={{95, 45.6}, {81, 45.6}, {81, 45.7}, {68.1, 45.7}}, thickness=0.25));
		connect(during_takeOff.y, propertytoreal.u)
		annotation(Line(visible=true, points={{41.2, 45.8}, {43.5, 45.8}, {43.5, 45.7}, {55.1, 45.7}}, thickness=0.25));
		connect(DA.outport, DA_takeOff.u)
		annotation(Line(visible=true, points={{-102, 45.9}, {-115, 45.9}, {-115, 26.5}, {-125, 26.5}}, thickness=0.25)); 
		connect(X.outport, X_takeOff.u)
		annotation(Line(visible=true, points={{27.5, 14.4}, {-9.58, 14.4}, {-9.58, 0.43}, {-21.7, 0.43}}, thickness=0.25));
		connect(X.outport, X_landing.u)
		annotation(Line(visible=true, points={{28.2, -17.6}, {-9.58, -17.6}, {-9.58, 0.43}, {-21.7, 0.43}}, thickness=0.25));
		connect(DA.outport, DA_landing.u)
		annotation(Line(visible=true, points={{-102, 8.86}, {-115, 8.86}, {-115, 26.5}, {-125, 26.5}}, thickness=0.25));
		connect(condition.y, during_takeOff.condition)
		annotation(Line(visible=true, points={{-13.7, 45.9}, {-11.4, 45.9}, {-11.4, 45.9}, {-1.8, 45.9}}, thickness=0.25));
		connect(DA_takeOff.y, condition.u1)
		annotation(Line(visible=true, points={{-59, 45.9}, {-54, 45.9}, {-54, 45.9}, {-36.7, 45.9}}, thickness=0.25));
		connect(DA_landing.y, condition.u2)
		annotation(Line(visible=true, points={{-59, 8.86}, {-54, 8.86}, {-54, 37.9}, {-36.7, 37.9}}, thickness=0.25));
		connect(X_takeOff.y, check.u1)
		annotation(Line(visible=true, points={{70.5, 14.4}, {75.5, 14.4}, {75.5, 5.43}, {95.5, 5.43}}, thickness=0.25));
		connect(X_landing.y, check.u2)
		annotation(Line(visible=true, points={{71.2, -17.6}, {76.2, -17.6}, {76.2, -2.57}, {95.2, -2.57}}, thickness=0.25));     

end Req_1_OR;
model Req_1 ""

  Modelica_Requirements.LogicalBlocks.WithinBand X_takeOff(u_max=400, u_min=300) annotation(Placement(visible = true, transformation(origin={-79.2, -20.5}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.LogicalBlocks.WithinBand DA_takeOff(u_max = 16, u_min = 14) annotation(Placement(visible = true, transformation(origin={-80, 45.9}, extent={{-20, -10}, {20, 10}})));   
  Modelica_Requirements.ChecksInFixedWindow.During during_takeOff(check = X_takeOff.y) annotation(Placement(visible = true, transformation(origin={3.08, 45.7}, extent={{-20, -10}, {20, 10}}))); 
 
  Modelica_Requirements.LogicalBlocks.WithinBand X_landing(u_max=700, u_min=650)  annotation(Placement(visible = true, transformation(origin={-80, -52.5}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.LogicalBlocks.WithinBand DA_landing(u_max = 36, u_min = 34)  annotation(Placement(visible = true, transformation(origin={-80, 12.7}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.ChecksInFixedWindow.During during_landing(check = X_landing.y) annotation(Placement(visible = true, transformation(origin={3.78, 12.7}, extent={{-20, -10}, {20, 10}})));
		
      LMS.AMESim.Blocks.SignalToAMESim property_takeOff
				annotation (Placement(transformation(origin={105, 45.6}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalToAMESim property_landing
				annotation (Placement(transformation(origin={106, 12.6}, extent={{-12, -10}, {12, 10}})));
				
		Modelica_Requirements.LogicalBlocks.PropertyToReal propertytoreal
				annotation (Placement(transformation(origin={62.1, 45.7}, extent={{-10, -10}, {10, 10}})));
		Modelica_Requirements.LogicalBlocks.PropertyToReal propertytoreal_1
				annotation (Placement(transformation(origin={63.2, 12.7}, extent={{-10, -10}, {10, 10}})));

		LMS.AMESim.Blocks.SignalFromAMESim DA
				annotation (Placement(transformation(origin={-135, 28.7}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim X
				annotation (Placement(transformation(origin={-133, -34.1}, extent={{-12, -10}, {12, 10}})));
      		 
equation
    annotation(uses(Modelica(version = "3.2.1"), Modelica_Requirements(version = "0.10")), experiment(StartTime = 0, StopTime = 6, Tolerance = 1e-06, Interval = 0.012), Diagram(coordinateSystem(extent={{-150, -100}, {150, 100}})));
		connect(property_takeOff.inport, propertytoreal.y)
		annotation(Line(visible=true, points={{95, 45.6}, {81, 45.6}, {81, 45.7}, {68.1, 45.7}}, thickness=0.25));
		connect(during_takeOff.y, propertytoreal.u)
		annotation(Line(visible=true, points={{24.1, 45.7}, {55, 45.7}, {55, 45.7}}, thickness=0.25));
		connect(DA.outport, DA_takeOff.u)
		annotation(Line(visible=true, points={{-102, 45.9}, {-115, 45.9}, {-115, 28.7}, {-125, 28.7}}, thickness=0.25)); 
		connect(X.outport, X_takeOff.u)
		annotation(Line(visible=true, points={{-101, -20.5}, {-113, -20.5}, {-113, -34.1}, {-123, -34.1}}, thickness=0.25));
		connect(X.outport, X_landing.u)
		annotation(Line(visible=true, points={{-102, -52.5}, {-113, -52.5}, {-113, -34.1}, {-123, -34.1}}, thickness=0.25));
		connect(DA.outport, DA_landing.u)
		annotation(Line(visible=true, points={{-102, 12.7}, {-115, 12.7}, {-115, 28.7}, {-125, 28.7}}, thickness=0.25));
		connect(DA_takeOff.y, during_takeOff.condition)
		annotation(Line(visible=true, points={{-59, 45.9}, {-54, 45.9}, {-54, 45.8}, {-18.9, 45.8}}, thickness=0.25));
		connect(property_landing.inport, propertytoreal_1.y)
		annotation(Line(visible=true, points={{96, 12.6}, {82, 12.6}, {82, 12.7}, {68, 12.7}}, thickness=0.25));
		connect(during_landing.y, propertytoreal_1.u)
		annotation(Line(visible=true, points={{24.8, 12.7}, {29.8, 12.7}, {29.8, 12.7}, {56.2, 12.7}}, thickness=0.25));
		connect(DA_landing.y, during_landing.condition)
		annotation(Line(visible=true, points={{-59, 12.7}, {-54, 12.7}, {-54, 12.8}, {-18.2, 12.8}}, thickness=0.25)); 

end Req_1;
 
	model Req_2 ""
		Modelica_Requirements.ChecksInFixedWindow.WithinDomain withindomain(polygon=[-5,  1.183333333333333; 700, 116.3333333333333; 700, 93.666666666666657; -5,   -2.683333333333334; -5,  1.183333333333333])
				annotation (Placement(transformation(origin={5.88, 8.23}, extent={{-20, -20}, {20, 20}})));
		LMS.AMESim.Blocks.SignalFromAMESim X_FowlerMotion
				annotation (Placement(transformation(origin={-80, -41.6}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim Y
				annotation (Placement(transformation(origin={-79.6, -76.2}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalToAMESim property_2
				annotation (Placement(transformation(origin={81.4, 8.12}, extent={{-12, -10}, {12, 10}})));
		Modelica_Requirements.LogicalBlocks.PropertyToReal propertytoreal
				annotation (Placement(transformation(origin={46.5, 8.22}, extent={{-10, -10}, {10, 10}})));
		LMS.AMESim.Blocks.SignalToAMESim distance
				annotation (Placement(transformation(origin={76.7, -33.1}, extent={{-12, -10}, {12, 10}})));
		Modelica_Requirements.Sources.BooleanConstant booleanconstant
				annotation (Placement(transformation(origin={-71.5, 8.46}, extent={{-10, -10}, {10, 10}})));
		Modelica.Blocks.Routing.Multiplex2 multiplex2
				annotation (Placement(transformation(origin={-42.3, -60}, extent={{-10, -10}, {10, 10}})));
		annotation(Diagram(coordinateSystem(extent={{-100, -100}, {100, 100}})));
	equation
		connect(X_FowlerMotion.outport, multiplex2.u1[1])
		annotation(Line(visible=true, points={{-70, -41.6}, {-65, -41.6}, {-65, -54}, {-54.3, -54}}, thickness=0.25));
		connect(Y.outport, multiplex2.u2[1])
		annotation(Line(visible=true, points={{-69.6, -76.2}, {-64.6, -76.2}, {-64.6, -66}, {-54.3, -66}}, thickness=0.25));
		connect(multiplex2.y[:], withindomain.point[:])
		annotation(Line(visible=true, points={{-31.3, -60}, {-26.3, -60}, {-26.3, -1.77}, {-16.1, -1.77}}, thickness=0.25));
	
	   connect(booleanconstant.y, withindomain.condition)
		annotation(Line(visible=true, points={{-16.1, 8.33}, {-57.1, 8.33}, {-57.1, 8.5}, {-60.5, 8.5}}, thickness=0.25));
		connect(withindomain.y, propertytoreal.u)
		annotation(Line(visible=true, points={{26.9, 8.23}, {31.9, 8.23}, {31.9, 8.22}, {39.5, 8.22}}, thickness=0.25));
		connect(propertytoreal.y, property_2.inport)
		annotation(Line(visible=true, points={{71.4, 8.12}, {57.4, 8.12}, {57.4, 8.22}, {52.4, 8.22}}, thickness=0.25));
		connect(distance.inport, withindomain.distance)
		annotation(Line(visible=true, points={{26.9, -1.77}, {42.3, -1.77}, {42.3, -33.4}, {66.3, -33.4}}, thickness=0.25));
		
	end Req_2;
 
model Req_3 ""

  Modelica_Requirements.LogicalBlocks.WithinBand Z_takeOff(u_max=-50, u_min=-150) annotation(Placement(visible = true, transformation(origin={-29.3, -33.3}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.LogicalBlocks.WithinBand X_takeOff(u_max = 400, u_min = 300) annotation(Placement(visible = true, transformation(origin={-80, 45.9}, extent={{-20, -10}, {20, 10}})));   
  Modelica_Requirements.ChecksInFixedWindow.During during_takeOff(check = Z_takeOff.y) annotation(Placement(visible = true, transformation(origin={3.08, 45.7}, extent={{-20, -10}, {20, 10}}))); 
 
  Modelica_Requirements.LogicalBlocks.WithinBand Z_landing(u_max=-320, u_min=-385)  annotation(Placement(visible = true, transformation(origin={-30.1, -65.3}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.LogicalBlocks.WithinBand X_landing(u_max = 700, u_min = 650)  annotation(Placement(visible = true, transformation(origin={-80, 8.86}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.ChecksInFixedWindow.During during_landing(check = Z_landing.y) annotation(Placement(visible = true, transformation(origin={3.78, 8.83}, extent={{-20, -10}, {20, 10}})));
		
      LMS.AMESim.Blocks.SignalToAMESim property_takeOff
				annotation (Placement(transformation(origin={105, 45.6}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalToAMESim property_landing
				annotation (Placement(transformation(origin={106, 8.75}, extent={{-12, -10}, {12, 10}})));
				
		Modelica_Requirements.LogicalBlocks.PropertyToReal propertytoreal
				annotation (Placement(transformation(origin={62.1, 45.7}, extent={{-10, -10}, {10, 10}})));
		Modelica_Requirements.LogicalBlocks.PropertyToReal propertytoreal_1
				annotation (Placement(transformation(origin={63.2, 8.85}, extent={{-10, -10}, {10, 10}})));

		LMS.AMESim.Blocks.SignalFromAMESim X
				annotation (Placement(transformation(origin={-133, 26.9}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim Z
				annotation (Placement(transformation(origin={-112, -46.6}, extent={{-12, -10}, {12, 10}})));
      
		
		 
equation
    annotation(uses(Modelica(version = "3.2.1"), Modelica_Requirements(version = "0.10")), experiment(StartTime = 0, StopTime = 6, Tolerance = 1e-06, Interval = 0.012), Diagram(coordinateSystem(extent={{-150, -100}, {150, 100}})));
		connect(property_takeOff.inport, propertytoreal.y)
		annotation(Line(visible=true, points={{95, 45.6}, {81, 45.6}, {81, 45.7}, {68.1, 45.7}}, thickness=0.25));
		connect(during_takeOff.y, propertytoreal.u)
		annotation(Line(visible=true, points={{24.1, 45.7}, {55, 45.7}, {55, 45.7}}, thickness=0.25));
		connect(X.outport, DA_takeOff.u)
		annotation(Line(visible=true, points={{-102, 45.9}, {-115, 45.9}, {-115, 26.5}, {-125, 26.5}}, thickness=0.25)); 
		connect(Z.outport, X_takeOff.u)
		annotation(Line(visible=true, points={{-51.3, -33.3}, {-89.9, -33.3}, {-89.9, -47}, {-102, -47}}, thickness=0.25));
		connect(Z.outport, X_landing.u)
		annotation(Line(visible=true, points={{-52.1, -65.3}, {-89.9, -65.3}, {-89.9, -47}, {-102, -47}}, thickness=0.25));
		connect(X.outport, DA_landing.u)
		annotation(Line(visible=true, points={{-102, 8.86}, {-115, 8.86}, {-115, 26.5}, {-125, 26.5}}, thickness=0.25));
		connect(DA_takeOff.y, during_takeOff.condition)
		annotation(Line(visible=true, points={{-59, 45.9}, {-54, 45.9}, {-54, 45.8}, {-18.9, 45.8}}, thickness=0.25));
		connect(property_landing.inport, propertytoreal_1.y)
		annotation(Line(visible=true, points={{97, 8.7}, {83, 8.7}, {83, 8.85}, {69.2, 8.85}}, thickness=0.25));
		connect(during_landing.y, propertytoreal_1.u)
		annotation(Line(visible=true, points={{24.8, 8.83}, {56.2, 8.83}, {56.2, 8.85}}, thickness=0.25));
		connect(DA_landing.y, during_landing.condition)
		annotation(Line(visible=true, points={{-59, 8.86}, {-54, 8.86}, {-54, 8.93}, {-18.2, 8.93}}, thickness=0.25));
		connect(X.outport, X_takeOff.u)
		annotation(Line(visible=true, points={{-123, 26.9}, {-118, 26.9}, {-118, 45.9}, {-102, 45.9}}, thickness=0.25));
		connect(X.outport, X_landing.u)
		annotation(Line(visible=true, points={{-123, 26.9}, {-118, 26.9}, {-118, 8.86}, {-102, 8.86}}, thickness=0.25));
		connect(X_landing.u, during_landing.condition)
		annotation(Line(visible=true, points={{-102, 8.86}, {-18.2, 8.86}, {-18.2, 8.93}}, thickness=0.25));
		connect(X_takeOff.y, during_takeOff.condition)
		annotation(Line(visible=true, points={{-59, 45.9}, {-54, 45.9}, {-54, 45.8}, {-18.9, 45.8}}, thickness=0.25)); 

	end Req_3;
 
	 
 
	 
	 
 
	
end Modelica_AME;