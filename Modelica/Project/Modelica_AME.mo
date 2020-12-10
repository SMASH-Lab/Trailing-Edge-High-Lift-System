package test_Modelica_AME ""
 
	model RC_stdLibrary ""
		Modelica.Electrical.Analog.Basic.Resistor resistor
				annotation (Placement(transformation(origin={21.9, 57.2}, extent={{-10, -10}, {10, 10}})));
		Modelica.Electrical.Analog.Basic.Ground ground
				annotation (Placement(transformation(origin={44.8, -31.2}, extent={{-10, -10}, {10, 10}})));
		Modelica.Electrical.Analog.Basic.Capacitor capacitor
				annotation (Placement(transformation(origin={44.9, 15.6}, extent={{-10, -10}, {10, 10}}, rotation=-90)));
		Modelica.Electrical.Analog.Sources.ConstantVoltage constantvoltage(V=15)
				annotation (Placement(transformation(origin={-37, 13.1}, extent={{-8.69, -10}, {8.69, 10}}, rotation=-90)));
		Modelica.Electrical.Analog.Basic.Ground ground_1
				annotation (Placement(transformation(origin={-36.9, -19.3}, extent={{-10, -10}, {10, 10}})));
		 
		 
		 
	equation
		connect(resistor.n, capacitor.p)
		annotation(Line(visible=true, points={{31.9, 57.3}, {44.9, 57.3}, {44.9, 25.7}}, thickness=0.25));
		connect(constantvoltage.n, ground_1.p)
		annotation(Line(visible=true, points={{-37, 4.44}, {-37, -0.56}, {-36.9, -0.56}, {-36.9, -9.56}}, thickness=0.25));
		connect(resistor.p, constantvoltage.p)
		annotation(Line(visible=true, points={{11.9, 57.3}, {-37, 57.3}, {-37, 21.8}}, thickness=0.25));
		connect(ground.p, capacitor.n)
		annotation(Line(visible=true, points={{44.8, -21.2}, {44.8, -16.2}, {44.9, -16.2}, {44.9, 5.6}}, thickness=0.25));
		annotation(Diagram(coordinateSystem(extent={{-100, -100}, {100, 100}})));   
	
	end RC_stdLibrary;
	model RLC_stdLibrary ""
		Modelica.Electrical.Analog.Basic.Resistor resistor(R=10)
				annotation (Placement(transformation(origin={-20, 68.6}, extent={{-10, -10}, {10, 10}})));
		Modelica.Electrical.Analog.Basic.Ground ground
				annotation (Placement(transformation(origin={21.9, -19.2}, extent={{-10, -10}, {10, 10}})));
		Modelica.Electrical.Analog.Basic.Capacitor capacitor(C=0.1)
				annotation (Placement(transformation(origin={22, 27.6}, extent={{-10, -10}, {10, 10}}, rotation=-90)));
		 
		Modelica.Electrical.Analog.Basic.Ground ground_1
				annotation (Placement(transformation(origin={-53.7, -9.73}, extent={{-10, -10}, {10, 10}})));
		Modelica.Electrical.Analog.Basic.Inductor inductor(L=0.0001)
				annotation (Placement(transformation(origin={56.1, 27.3}, extent={{-10, -10}, {10, 10}}, rotation=-90)));
		Modelica.Electrical.Analog.Basic.Ground ground_2
				annotation (Placement(transformation(origin={55.8, -18.8}, extent={{-10, -10}, {10, 10}})));
		Modelica.Electrical.Analog.Sources.SineVoltage sinevoltage(V=15, freqHz=1)
				annotation (Placement(transformation(origin={-53.6, 34.2}, extent={{-10, -10}, {10, 10}}, rotation=-90)));
		 
	equation
		 connect(ground.p, capacitor.n)
		annotation(Line(visible=true, points={{21.9, -9.24}, {21.9, -4.24}, {22, -4.24}, {22, 17.6}}, thickness=0.25)); 
		annotation(Diagram(coordinateSystem(extent={{-100, -100}, {100, 100}})));
		connect(inductor.n, ground_2.p)
		annotation(Line(visible=true, points={{56.1, 17.3}, {56.1, 13.5}, {56, 13.5}, {56, -9}}, thickness=0.25)); 
		connect(capacitor.p, resistor.n)
		annotation(Line(visible=true, points={{-10, 68.6}, {22, 68.6}, {22, 37.6}}, thickness=0.25));
		connect(inductor.p, resistor.n)
		annotation(Line(visible=true, points={{-10, 68.6}, {56.1, 68.6}, {56.1, 37.3}}, thickness=0.25));
		connect(sinevoltage.n, ground_1.p)
		annotation(Line(visible=true, points={{-53.6, 24.3}, {-53.6, 11.3}, {-53.7, 11.3}, {-53.7, 0.27}}, thickness=0.25));
		connect(resistor.p, sinevoltage.p)
		annotation(Line(visible=true, points={{-30, 68.6}, {-53.6, 68.6}, {-53.6, 44.3}}, thickness=0.25)); 
	
	end RLC_stdLibrary;
	 
	 
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
	 
	 
      model VelInputForceOutput "From Modelica point of view, input = {Velocity}, output = {Force}"
            LMS.Mechanics.Translational.Interfaces.Flange_a flange_a annotation (
               Placement(transformation(origin={-100,0}, extent={{-20,-20}, {20,20}}),
               iconTransformation(origin={-100,0}, extent={{-20,-20}, {20,20}})));
            LMS.AMESim.Mechanics.Translational.FlangeForceOutputVelInput ameport annotation (
               __imagine(port(port_type=lshaft)),
               Placement(transformation(origin={100,0}, extent={{-20,-20}, {20,20}}),
               iconTransformation(origin={100,0}, extent={{-20,-20}, {20,20}})));
            equation
            ameport.vel = der(flange_a.s);
            ameport.force = flange_a.f;
            annotation (Icon(
               coordinateSystem(extent={{-120, -100}, {120, 100}}), graphics={
               Rectangle(lineColor={0, 172, 0}, fillColor={235, 235, 235}, extent={{-100, -100}, {100, 100}}), 
               Text(origin={38.1, 20.9}, lineColor={0, 172, 0}, fillColor={0, 172, 0}, fillPattern=FillPattern.Solid, extent={{-50, -30}, {50, 30}}, textString="v", fontSize=36, fontName="Arial", horizontalAlignment=TextAlignment.Left), 
               Line(points={{60, 40}, {-60, 40}}, color={0, 172, 0}), 
               Polygon(lineColor={0, 172, 0}, fillColor={0, 172, 0}, fillPattern=FillPattern.Solid, points={{-40, 60}, {-40, 20}, {-60, 40}}), 
               Text(origin={35.1, -55}, lineColor={0, 172, 0}, fillColor={0, 172, 0}, fillPattern=FillPattern.Solid, extent={{-50, -30}, {50, 30}}, textString="F", fontSize=36, fontName="Arial", horizontalAlignment=TextAlignment.Left), 
               Line(points={{-60, -40}, {60, -40}}, color={0, 172, 0}), 
               Polygon(lineColor={0, 172, 0}, fillColor={0, 172, 0}, fillPattern=FillPattern.Solid, points={{40, -20}, {40, -60}, {60, -40}})}));
      end VelInputForceOutput;
	 
      model ExtSumTestWithAdapters "External function test with signal adapters"
         ExtSumTest extsumtest
            annotation (Placement(transformation(origin={0,0}, extent={{-10,-10}, {10,10}})));
         AMESim.Blocks.SignalToAMESim c
            annotation (Placement(transformation(origin={30.2, 0.132}, extent={{-12, -10}, {12, 10}})));
         AMESim.Blocks.SignalFromAMESim a
            annotation (Placement(transformation(origin={-29.9, 20.5}, extent={{-12, -10}, {12, 10}})));
         AMESim.Blocks.SignalFromAMESim b
            annotation (Placement(transformation(origin={-29.7, -20.3}, extent={{-12, -10}, {12, 10}})));
         annotation(Diagram(coordinateSystem(extent={{-50, -50}, {50, 50}})));
       equation
   		connect(a.outport, extsumtest.a)
   			annotation(
   				Line(points={{-19.9, 20.5}, {-13.8, 20.5}, {-13.8, 4}, {-8, 4}}, thickness=0.25));
   		connect(b.outport, extsumtest.b)
   			annotation(
   				Line(points={{-19.7, -20.3}, {-13.4, -20.3}, {-13.4, -4}, {-8, -4}}, thickness=0.25));
   		connect(extsumtest.aplusb, c.inport)
   			annotation(
   				Line(points={{8, 0}, {20.2, 0}, {20.2, 0.13}}, thickness=0.25));
   	   annotation(experiment(StopTime=1));
      end ExtSumTestWithAdapters;
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
   	model ExtSumTest  "Test the external function 'add'"
   		Blocks.Interfaces.RealOutput aplusb
   				  "output signal a+b" annotation (Placement(transformation(origin={40.2, 0}, extent={{-10, -10}, {10, 10}}), iconTransformation(origin={40, 0}, extent={{-10, -10}, {10, 10}})));
   		Blocks.Interfaces.RealInput a
   				 "input 1" annotation (Placement(transformation(origin={-40, 20}, extent={{-10, -10}, {10, 10}}), iconTransformation(origin={-40, 20}, extent={{-10, -10}, {10, 10}})));
   		Blocks.Interfaces.RealInput b
   				 "input 2" annotation (Placement(transformation(origin={-40, -20}, extent={{-10, -10}, {10, 10}}), iconTransformation(origin={-40, -20}, extent={{-10, -10}, {10, 10}})));		 
        equation
           aplusb = add(a,b);
   		annotation(Diagram(
   				coordinateSystem(extent={{-50, -50}, {50, 50}})), Icon(
   				coordinateSystem(extent={{-50, -50}, {50, 50}}), graphics={
   				Rectangle(lineColor={8, 0, 0}, fillColor={48, 86, 255}, fillPattern=FillPattern.Solid, lineThickness=1, extent={{-30, -30}, {30, 30}}), 
   				Line(points={{1.2, 9.6}, {1.2, -10.4}}, color={8, 0, 0}, thickness=1), 
   				Line(points={{-8.65, -0.26}, {11.4, -0.26}}, color={8, 0, 0}, thickness=1)})); 
      end ExtSumTest;
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
model max_rising ""
      Modelica.Blocks.Sources.BooleanTable condition(table = {1, 2, 3, 3.5, 4}, startValue = false) annotation(Placement(transformation(origin={-40, 30}, extent={{-10, -10}, {10, 10}})));
      Modelica.Blocks.Sources.BooleanTable check(startValue = true, table = {0.2, 0.3, 0.4, 1.1, 1.2, 1.3, 1.4, 2.2, 2.5, 3.1, 3.15, 3.2, 3.25, 3.3, 3.35, 3.4, 3.45}) annotation(Placement(transformation(origin={-40, -8}, extent={{-10, -10}, {10, 10}})));
      Modelica_Requirements.ChecksInFixedWindow.MaxRising maxRising(check = check.y,
          nRisingMax=3)                                                                              annotation(Placement(transformation(origin={10, 30}, extent={{-20, -10}, {20, 10}})));
	equation
		connect(condition.y, maxRising.condition)
		annotation(Line(visible=true, points={{-29, 30}, {-20, 30}, {-20, 30.1}, {-12, 30.1}}, thickness=0.25));
		annotation(Diagram(coordinateSystem(extent={{-100, -100}, {100, 100}})));
	
	end max_rising;
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
 
	 
 
 
model Req_1 ""

  Modelica_Requirements.LogicalBlocks.WithinBand DA_takeOff(u_max = 16, u_min = 14) annotation(Placement(visible = true, transformation(origin={-80, 44}, extent={{-20, -10}, {20, 10}})));
   
  Modelica_Requirements.ChecksInFixedWindow.During during1(check = check.y) annotation(Placement(visible = true, transformation(origin={24, 24}, extent={{-20, -10}, {20, 10}})));
   
  Modelica_Requirements.LogicalBlocks.WithinBand X_takeOff(u_max=400, u_min=300) annotation(Placement(visible = true, transformation(origin={-27.4, -33.3}, extent={{-20, -10}, {20, 10}})));
  Modelica.Blocks.Logical.Or check annotation(Placement(visible = true, transformation(origin={28.6, -57.3}, extent={{-10, -10}, {10, 10}})));
  Modelica.Blocks.Logical.Or condition annotation(Placement(visible = true, transformation(origin={-28, 24}, extent={{-10, -10}, {10, 10}})));
  Modelica_Requirements.LogicalBlocks.WithinBand X_landing(u_max=700, u_min=650)  annotation(Placement(visible = true, transformation(origin={-26.7, -65.3}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.LogicalBlocks.WithinBand DA_landing(u_max = 36, u_min = 34)  annotation(Placement(visible = true, transformation(origin={-80, 10}, extent={{-20, -10}, {20, 10}})));
		LMS.AMESim.Blocks.SignalToAMESim property_1
				annotation (Placement(transformation(origin={121, 23.5}, extent={{-12, -10}, {12, 10}})));
		Modelica_Requirements.LogicalBlocks.PropertyToReal propertytoreal
				annotation (Placement(transformation(origin={87.2, 23.6}, extent={{-10, -10}, {10, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim DA
				annotation (Placement(transformation(origin={-135, 26.5}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim X_FowlerMotion
				annotation (Placement(transformation(origin={-80.4, -48.1}, extent={{-12, -10}, {12, 10}})));
		 
equation
  connect(condition.y, during1.condition) annotation(Line(visible=true, points={{1.98, 24.1}, {-11, 24.1}, {-11, 24}, {-17, 24}}, thickness=0.25));
  connect(DA_takeOff.y, condition.u1) annotation(Line(visible=true, points={{-58, 44}, {-50, 44}, {-50, 24}, {-40, 24}}, thickness=0.25));
  connect(DA_landing.y, condition.u2) annotation(Line(visible=true, points={{-58, 10}, {-50, 10}, {-50, 16}, {-40, 16}}, thickness=0.25));  
  connect(X_landing.y, check.u2) annotation(Line(visible=true, points={{16.6, -65.3}, {-5.74, -65.3}}, thickness=0.25));
  connect(X_takeOff.y, check.u1) annotation(Line(visible=true, points={{-6.44, -33.3}, {5.56, -33.3}, {5.56, -57.3}, {16.6, -57.3}}, thickness=0.25)); 
  annotation(uses(Modelica(version = "3.2.1"), Modelica_Requirements(version = "0.10")), experiment(StartTime = 0, StopTime = 6, Tolerance = 1e-06, Interval = 0.012), Diagram(coordinateSystem(extent={{-150, -100}, {150, 100}})));
		connect(property_1.inport, propertytoreal.y)
		annotation(Line(visible=true, points={{111, 23.5}, {96.9, 23.5}, {96.9, 23.6}, {92.9, 23.6}}, thickness=0.25));
		connect(during1.y, propertytoreal.u)
		annotation(Line(visible=true, points={{45, 24}, {80, 24}, {80, 23.6}}, thickness=0.25));
		connect(DA.outport, DA_takeOff.u)
		annotation(Line(visible=true, points={{-125, 26.5}, {-115, 26.5}, {-115, 44}, {-102, 44}}, thickness=0.25)); 
		connect(X_FowlerMotion.outport, X_takeOff.u)
		annotation(Line(visible=true, points={{-49.4, -33.3}, {-65.4, -33.3}, {-65.4, -48.3}, {-70.4, -48.3}}, thickness=0.25));
		connect(X_FowlerMotion.outport, X_landing.u)
		annotation(Line(visible=true, points={{-48.7, -65.3}, {-65.7, -65.3}, {-65.7, -48.3}, {-70.7, -48.3}}, thickness=0.25));
		connect(DA.outport, DA_landing.u)
		annotation(Line(visible=true, points={{-125, 26.5}, {-115, 26.5}, {-115, 10}, {-102, 10}}, thickness=0.25)); 

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

  Modelica_Requirements.LogicalBlocks.WithinBand X_takeOff(u_max=400, u_min=300) annotation(Placement(visible = true, transformation(origin={-61.9, 43.6}, extent={{-20, -10}, {20, 10}})));
   
  Modelica_Requirements.ChecksInFixedWindow.During during1(check = check.y) annotation(Placement(visible = true, transformation(origin={42.1, 23.6}, extent={{-20, -10}, {20, 10}})));
   
  Modelica_Requirements.LogicalBlocks.WithinBand Z_takeOff(u_max=-50, u_min=-150) annotation(Placement(visible = true, transformation(origin={-27.4, -33.3}, extent={{-20, -10}, {20, 10}})));
  Modelica.Blocks.Logical.Or check annotation(Placement(visible = true, transformation(origin={28.6, -57.3}, extent={{-10, -10}, {10, 10}})));
  Modelica.Blocks.Logical.Or condition annotation(Placement(visible = true, transformation(origin={-9.92, 23.6}, extent={{-10, -10}, {10, 10}})));
  Modelica_Requirements.LogicalBlocks.WithinBand Z_landing(u_max=-325, u_min=-385)  annotation(Placement(visible = true, transformation(origin={-26.7, -65.3}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.LogicalBlocks.WithinBand X_landing(u_max=700, u_min=650)  annotation(Placement(visible = true, transformation(origin={-62.7, 9.62}, extent={{-20, -10}, {20, 10}})));
		LMS.AMESim.Blocks.SignalToAMESim property_3
				annotation (Placement(transformation(origin={121, 23.5}, extent={{-12, -10}, {12, 10}})));
		Modelica_Requirements.LogicalBlocks.PropertyToReal propertytoreal
				annotation (Placement(transformation(origin={87.2, 23.6}, extent={{-10, -10}, {10, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim DA
				annotation (Placement(transformation(origin={-130, 26.5}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim X_FowlerMotion
				annotation (Placement(transformation(origin={-80.4, -48.1}, extent={{-12, -10}, {12, 10}})));
		 
equation
  connect(condition.y, during1.condition) annotation(Line(visible=true, points={{20.1, 23.7}, {7.08, 23.7}, {7.08, 23.6}, {1.08, 23.6}}, thickness=0.25));
  connect(X_takeOff.y, condition.u1) annotation(Line(visible=true, points={{-40.9, 43.6}, {-32.9, 43.6}, {-32.9, 23.6}, {-22.9, 23.6}}, thickness=0.25));
  connect(X_landing.y, condition.u2) annotation(Line(visible=true, points={{-21.9, 15.6}, {-31.9, 15.6}, {-31.9, 9.62}, {-41.7, 9.62}}, thickness=0.25));  
  connect(Z_landing.y, check.u2) annotation(Line(visible=true, points={{16.6, -65.3}, {-5.74, -65.3}}, thickness=0.25));
  connect(Z_takeOff.y, check.u1) annotation(Line(visible=true, points={{-6.44, -33.3}, {5.56, -33.3}, {5.56, -57.3}, {16.6, -57.3}}, thickness=0.25)); 
  annotation(uses(Modelica(version = "3.2.1"), Modelica_Requirements(version = "0.10")), experiment(StartTime = 0, StopTime = 6, Tolerance = 1e-06, Interval = 0.012), Diagram(coordinateSystem(extent={{-150, -100}, {150, 100}})));
		connect(property_3.inport, propertytoreal.y)
		annotation(Line(visible=true, points={{111, 23.5}, {96.9, 23.5}, {96.9, 23.6}, {92.9, 23.6}}, thickness=0.25));
		connect(during1.y, propertytoreal.u)
		annotation(Line(visible=true, points={{63.1, 23.6}, {80, 23.6}, {80, 23.6}}, thickness=0.25));
		connect(DA.outport, X_takeOff.u)
		annotation(Line(visible=true, points={{-83.9, 43.6}, {-101, 43.6}, {-101, 26.5}, {-120, 26.5}}, thickness=0.25)); 
		connect(X_FowlerMotion.outport, Z_takeOff.u)
		annotation(Line(visible=true, points={{-49.4, -33.3}, {-65.4, -33.3}, {-65.4, -48.3}, {-70.4, -48.3}}, thickness=0.25));
		connect(X_FowlerMotion.outport, Z_landing.u)
		annotation(Line(visible=true, points={{-48.7, -65.3}, {-65.7, -65.3}, {-65.7, -48.3}, {-70.7, -48.3}}, thickness=0.25));
		connect(DA.outport, X_landing.u)
		annotation(Line(visible=true, points={{-84.7, 9.62}, {-101, 9.62}, {-101, 26.5}, {-120, 26.5}}, thickness=0.25)); 

end Req_3;
	 
 
	 
	 
 
	
end test_Modelica_AME;