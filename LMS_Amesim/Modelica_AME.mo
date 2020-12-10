package Modelica_AME ""
 
	 
	 
	 
	 
	 
model test_InterfaceBlocks ""
		 
		Modelica.Blocks.Sources.Step step(height=10, startTime=5)
				annotation (Placement(transformation(origin={-63.5, -20.7}, extent={{-10, -10}, {10, 10}})));
		 
		LMS.AMESim.Blocks.SignalToAMESim signaltoamesim_1
				annotation (Placement(transformation(origin={68.5, -20.6}, extent={{-12, -10}, {12, 10}})));
       
		LMS.AMESim.Blocks.SignalToAMESim signaltoamesim_2
				annotation (Placement(transformation(origin={34.4, 29.5}, extent={{-12, -10}, {12, 10}})));
		Modelica.Blocks.Sources.BooleanExpression booleanexpression(y=false)
				annotation (Placement(transformation(origin={-53.8, 29.4}, extent={{-10, -10}, {10, 10}})));
		Modelica_Requirements.LogicalBlocks.WithinBand withinband (u_max = 15, u_min = 5)
				annotation (Placement(transformation(origin={-10.3, -20.7}, extent={{-20, -10}, {20, 10}})));
		 
		Modelica_AME.BooleanToReal booleantoreal_2
				annotation (Placement(transformation(origin={-16, 29.5}, extent={{-10, -10}, {10, 10}})));
		Modelica_AME.BooleanToReal booleantoreal_2_1
				annotation (Placement(transformation(origin={31.1, -20.9}, extent={{-10, -10}, {10, 10}})));
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		annotation(Diagram(coordinateSystem(extent={{-100, -100}, {100, 100}})));
	equation
		connect(booleanexpression.y, booleantoreal_2.u)
		annotation(Line(visible=true, points={{-42.8, 29.4}, {-23, 29.4}, {-23, 29.5}}, thickness=0.25));
		connect(booleantoreal_2.y, signaltoamesim_2.inport)
		annotation(Line(visible=true, points={{-10, 29.5}, {24.4, 29.5}}, thickness=0.25));
		connect(step.y, withinband.u)
		annotation(Line(visible=true, points={{-52.5, -20.7}, {-32.3, -20.7}}, thickness=0.25));
		connect(booleantoreal_2_1.y, signaltoamesim_1.inport)
		annotation(Line(visible=true, points={{37.1, -20.9}, {58.5, -20.9}, {58.5, -20.6}}, thickness=0.25));
		connect(withinband.y, booleantoreal_2_1.u)
		annotation(Line(visible=true, points={{10.7, -20.7}, {24.1, -20.7}, {24.1, -20.9}}, thickness=0.25));  

	end test_InterfaceBlocks;
model During ""
		Modelica_Requirements.ChecksInFixedWindow.During during(check = withinband_1.y)
				annotation (Placement(transformation(origin={13.5, 47.1}, extent={{-20, -10}, {20, 10}})));
		Modelica_Requirements.LogicalBlocks.WithinBand withinband(u_max=15, u_min=5)
				annotation (Placement(transformation(origin={-42.1, 47.5}, extent={{-20, -10}, {20, 10}})));
		Modelica_Requirements.LogicalBlocks.WithinBand withinband_1(u_max=15, u_min=5)
				annotation (Placement(transformation(origin={-40.1, -10.7}, extent={{-20, -10}, {20, 10}})));
		 
		 
		 
		 
		LMS.AMESim.Blocks.SignalToAMESim signaltoamesim
				annotation (Placement(transformation(origin={101, 46.9}, extent={{-12, -10}, {12, 10}})));
		 
		Modelica.Blocks.Sources.Step step(height=10, startTime=4)
				annotation (Placement(transformation(origin={-114, 47.6}, extent={{-10, -10}, {10, 10}})));
		Modelica.Blocks.Sources.Step step_1(height=10, startTime=6)
				annotation (Placement(transformation(origin={-115, -10.6}, extent={{-10, -10}, {10, 10}})));
		Modelica_Requirements.LogicalBlocks.PropertyToReal propertytoreal
				annotation (Placement(transformation(origin={63.8, 47.4}, extent={{-10, -10}, {10, 10}})));
		Modelica_AME.PropertyToReal propertytoreal_1
				annotation (Placement(transformation(origin={62.1, 46.8}, extent={{-10, -10}, {10, 10}})));
		 
		 
		 
		 
		 
		 
		 
		 
		 
		annotation(Diagram(coordinateSystem(extent={{-150, -100}, {150, 100}})));
	equation
		  connect(withinband.y, during.condition)
		annotation(Line(visible=true, points={{-8.5, 47.2}, {-16, 47.2}, {-16, 47.5}, {-21, 47.5}}, thickness=0.25)); 
		connect(step.y, withinband.u)
		annotation(Line(visible=true, points={{-64.1, 47.5}, {-98.6, 47.5}, {-98.6, 47.6}, {-103, 47.6}}, thickness=0.25));
		connect(step_1.y, withinband_1.u)
		annotation(Line(visible=true, points={{-104, -10.6}, {-99, -10.6}, {-99, -10.7}, {-62.1, -10.7}}, thickness=0.25));
		connect(during.y, propertytoreal.u)
		annotation(Line(visible=true, points={{34.5, 47.5}, {40, 47.5}, {40, 47.4}, {56.8, 47.4}}, thickness=0.25));
		connect(propertytoreal.y, signaltoamesim.inport)
		annotation(Line(visible=true, points={{87.5, 47.3}, {74, 47.3}, {74, 47.4}, {69.8, 47.4}}, thickness=0.25));
		connect(during.y, propertytoreal_1.u)
		annotation(Line(visible=true, points={{34.5, 47.1}, {55.1, 47.1}, {55.1, 46.8}}, thickness=0.25));
		connect(propertytoreal_1.y, signaltoamesim.inport)
		annotation(Line(visible=true, points={{68.1, 46.8}, {90.9, 46.8}, {90.9, 46.9}}, thickness=0.25));         
	
	end During;
model timeTable ""
	Modelica.Blocks.Sources.TimeTable timetable(table=[0, 0; 1, 1; 2, 2; 3, 3; 4, 4; 5, 5; 6, 6; 7, 7; 8, 8; 9, 9; 10, 10])
			annotation (Placement(transformation(origin={-75, 19.9}, extent={{-10, -10}, {10, 10}})));
		LMS.AMESim.Blocks.SignalToAMESim signaltoamesim
				annotation (Placement(transformation(origin={2.11, 20.1}, extent={{-12, -10}, {12, 10}})));
		annotation(Diagram(coordinateSystem(extent={{-100, -100}, {100, 100}})));
	equation
		connect(timetable.y, signaltoamesim.inport)
		annotation(Line(visible=true, points={{-64, 19.9}, {-56.6, 19.9}, {-56.6, 20}, {-7.89, 20}}, thickness=0.25));
	
	end timeTable;
model MaxRising ""
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
	
	end MaxRising;
block PropertyToReal
	"Convert Property (Violated, Undecided, Satisfied) to Real (1,2,3)"
    import Modelica_Requirements.Types.Property;
    import Modelica_Requirements.Interfaces;
    extends Interfaces.PartialConversion;
    Modelica_Requirements.Interfaces.PropertyInput u "Property input signal"
      annotation (Placement(transformation(extent={{-90,-20},{-50,20}})));
      Modelica.Blocks.Interfaces.RealOutput y
      "Integer output signal (values 1,2,3)"
      annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  equation
    y = if u == Property.Satisfied then 3 else
     (if u == Property.Undecided then 2 else 1);
    annotation (defaultComponentName="PtoI1",Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}},
          grid={1,1}),     graphics={Text(
            extent={{-48,48},{0,-0}},
            lineColor={0,0,0},
            fillColor={210,210,210},
            fillPattern=FillPattern.Solid,
            fontSize=10,
            textString="P"), Text(
            extent={{0,0},{48,-48}},
            lineColor={0,0,0},
            fillColor={210,210,210},
            fillPattern=FillPattern.Solid,
            fontSize=10,
            textString="I")}), Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={1,1})),
      Documentation(info="<html>
<p>
The Property input u is converted to an Integer output y according to the following table:
</p>

<blockquote>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Property u = </th>
    <th>Integer y =</th></tr>

<tr><td align=\"center\">Violated</td>
    <td align=\"center\">1</td> </tr>

<tr><td align=\"center\">Undecided</td>
    <td align=\"center\">2</td> </tr>

<tr><td align=\"center\">Satisfied</td>
    <td align=\"center\">3</td> </tr>
</table>
</table>
</p></blockquote>

<p>
This block is demonstrated with example
<a href=\"modelica://Modelica_Requirements.Examples.Elementary.LogicalBlocks.Conversions\">Conversions</a>.
</p>
</html>"));
	end PropertyToReal;
block BooleanToReal
	"Convert Boolean (false,true) to Real (0, 1)"
    import Modelica_Requirements.Types.Property;
    import Modelica_Requirements.Interfaces;
    extends Interfaces.PartialConversion;
    Modelica.Blocks.Interfaces.BooleanInput u "Boolean input signal"
      annotation (Placement(transformation(extent={{-90,-20},{-50,20}})));
          
    Modelica.Blocks.Interfaces.RealOutput y
      "Real output signal (values 0,1)"
      annotation (Placement(transformation(extent={{50,-10},{70,10}})));
      
    
  equation
    y = if u then 1 else 0;

end BooleanToReal;
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
		Modelica_AME.PropertyToReal propertytoreal
				annotation (Placement(transformation(origin={35.1, -20.1}, extent={{-10, -10}, {10, 10}})));
		Modelica_AME.BooleanToReal booleantoreal_2
				annotation (Placement(transformation(origin={-16, 29.5}, extent={{-10, -10}, {10, 10}})));
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		annotation(Diagram(coordinateSystem(extent={{-100, -100}, {100, 100}})));
	equation
		 connect(booleantoreal.y, signaltoamesim_2.inport)
		annotation(Line(visible=true, points={{24.4, 29.5}, {10, 29.5}, {10, 29.3}, {-8.8, 29.3}}, thickness=0.25));
		connect(booleanexpression.y, booleantoreal.u)
		annotation(Line(visible=true, points={{-49, 29.4}, {-46.4, 29.4}, {-46.4, 29.3}, {-21.8, 29.3}}, thickness=0.25));
		connect(booleanexpression.y, booleantoreal.u)
		annotation(Line(visible=true, points={{-42.8, 29.4}, {-41, 29.4}, {-41, 29.3}, {-21.8, 29.3}}, thickness=0.25));
		connect(step.y, withinband.u)
		annotation(Line(visible=true, points={{-52.5, -21}, {-47.5, -21}, {-47.5, -20.7}, {-32.3, -20.7}}, thickness=0.25));
		connect(withinband.y, booleantoreal_1.u)
		annotation(Line(visible=true, points={{10.7, -20.7}, {20.5, -20.7}, {20.5, -20.8}, {29.9, -20.8}}, thickness=0.25));
		connect(booleantoreal_1.y, signaltoamesim_1.inport)
		annotation(Line(visible=true, points={{42.9, -20.8}, {45.5, -20.8}, {45.5, -20.6}, {58.5, -20.6}}, thickness=0.25));
		connect(withinband.y, propertytoreal.u)
		annotation(Line(visible=true, points={{10.7, -20.7}, {28.1, -20.7}, {28.1, -20.1}}, thickness=0.25));
		connect(propertytoreal.y, signaltoamesim_1.inport)
		annotation(Line(visible=true, points={{41.1, -20.1}, {58.5, -20.1}, {58.5, -20.6}}, thickness=0.25));
		connect(booleanexpression.y, booleantoreal_2.u)
		annotation(Line(visible=true, points={{-42.8, 29.4}, {-23, 29.4}, {-23, 29.5}}, thickness=0.25));
		connect(booleantoreal_2.y, signaltoamesim_2.inport)
		annotation(Line(visible=true, points={{-9.99, 29.5}, {24.4, 29.5}, {24.4, 29.5}}, thickness=0.25));            
	
	end Constant;
	 
 
 
 
 
 
model test_AME_Input ""

		Modelica_Requirements.ChecksInFixedWindow.During during(check = check.y)
				annotation (Placement(transformation(origin={4.67, 37.5}, extent={{-20, -10}, {20, 10}})));
		Modelica_Requirements.LogicalBlocks.WithinBand condition(u_max=15, u_min=4)
				annotation (Placement(transformation(origin={-54.8, 47.5}, extent={{-20, -10}, {20, 10}})));
		Modelica_Requirements.LogicalBlocks.WithinBand check(u_max=15, u_min=4)
				annotation (Placement(transformation(origin={-40.1, -10.7}, extent={{-20, -10}, {20, 10}})));
		 
		 
		 
		 
		LMS.AMESim.Blocks.SignalToAMESim signaltoamesim
				annotation (Placement(transformation(origin={88.5, 37.3}, extent={{-12, -10}, {12, 10}})));
		 
		Modelica.Blocks.Sources.Step step(height=10, startTime=4)
				annotation (Placement(transformation(origin={-117, 62}, extent={{-10, -10}, {10, 10}})));
		Modelica.Blocks.Sources.Step step_1(height=10, startTime=6)
				annotation (Placement(transformation(origin={-79.9, 10.7}, extent={{-10, -10}, {10, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim signalfromamesim
				annotation (Placement(transformation(origin={-115, 25.4}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim signalfromamesim_1
				annotation (Placement(transformation(origin={-114, -11}, extent={{-12, -10}, {12, 10}})));
		Modelica_AME.PropertyToReal propertytoreal_1
				annotation (Placement(transformation(origin={56.2, 37.3}, extent={{-10, -10}, {10, 10}})));
		 
		 
		 
		 
		 
		 
		 
		 
		 
		annotation(Diagram(coordinateSystem(extent={{-150, -100}, {150, 100}})));
	equation
		  connect(condition.y, during.condition)
		annotation(Line(visible=true, points={{-17.3, 37.6}, {-26.6, 37.6}, {-26.6, 47.5}, {-33.8, 47.5}}, thickness=0.25)); 
		connect(during.y, propertytoreal_1.u)
		annotation(Line(visible=true, points={{25.7, 37.5}, {40, 37.5}, {40, 37.4}, {44.1, 37.4}}, thickness=0.25));
		connect(propertytoreal_1.y, signaltoamesim.inport)
		annotation(Line(visible=true, points={{71.7, 37.3}, {67.2, 37.3}, {67.2, 37.4}, {57.1, 37.4}}, thickness=0.25));
		connect(signalfromamesim.outport, condition.u)
		annotation(Line(visible=true, points={{-76.8, 47.5}, {-100, 47.5}, {-100, 25.4}, {-105, 25.4}}, thickness=0.25));
		connect(signalfromamesim_1.outport, check.u)
		annotation(Line(visible=true, points={{-62.1, -11}, {-91.9, -11}, {-91.9, -11}, {-104, -11}}, thickness=0.25));
		connect(during.y, propertytoreal_1.u)
		annotation(Line(visible=true, points={{25.7, 37.5}, {30.7, 37.5}, {30.7, 37.3}, {49.2, 37.3}}, thickness=0.25));
		connect(propertytoreal_1.y, signaltoamesim.inport)
		annotation(Line(visible=true, points={{62.2, 37.3}, {78.5, 37.3}, {78.5, 37.3}}, thickness=0.25));          
	

	end test_AME_Input;
 
	 
 
 
model Req_1_OR ""

  Modelica_Requirements.LogicalBlocks.WithinBand X_takeOff(u_max=400, u_min=300) annotation(Placement(visible = true, transformation(origin={-62.4, -14.1}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.LogicalBlocks.WithinBand DA_takeOff(u_max = 16, u_min = 14) annotation(Placement(visible = true, transformation(origin={-82.5, 55.3}, extent={{-20, -10}, {20, 10}})));   
  Modelica_Requirements.ChecksInFixedWindow.During during_takeOff(check = check.y) annotation(Placement(visible = true, transformation(origin={20.2, 45.8}, extent={{-20, -10}, {20, 10}}))); 
 
  Modelica_Requirements.LogicalBlocks.WithinBand X_landing(u_max=700, u_min=650)  annotation(Placement(visible = true, transformation(origin={-61.7, -46.1}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.LogicalBlocks.WithinBand DA_landing(u_max = 36, u_min = 34)  annotation(Placement(visible = true, transformation(origin={-82.5, 21.5}, extent={{-20, -10}, {20, 10}})));
   
		
      LMS.AMESim.Blocks.SignalToAMESim property_takeOff
				annotation (Placement(transformation(origin={105, 45.6}, extent={{-12, -10}, {12, 10}})));		 		
		 

		LMS.AMESim.Blocks.SignalFromAMESim DA
				annotation (Placement(transformation(origin={-134, 37}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim X
				annotation (Placement(transformation(origin={-122, -25.6}, extent={{-12, -10}, {12, 10}})));
		Modelica.Blocks.Logical.Or condition
				annotation (Placement(transformation(origin={-24.7, 45.9}, extent={{-10, -10}, {10, 10}})));
		Modelica.Blocks.Logical.Or check
				annotation (Placement(transformation(origin={-1.95, -28.7}, extent={{-10, -10}, {10, 10}})));
		Modelica_AME.PropertyToReal propertytoreal
				annotation (Placement(transformation(origin={74.1, 45.9}, extent={{-10, -10}, {10, 10}})));
		 
      		 
equation
    annotation(uses(Modelica(version = "3.2.1"), Modelica_Requirements(version = "0.10")), experiment(StartTime = 0, StopTime = 6, Tolerance = 1e-06, Interval = 0.012), Diagram(coordinateSystem(extent={{-150, -100}, {150, 100}})));
		connect(property_takeOff.inport, propertytoreal.y)
		annotation(Line(visible=true, points={{95, 45.6}, {81, 45.6}, {81, 45.7}, {68.1, 45.7}}, thickness=0.25));
		connect(during_takeOff.y, propertytoreal.u)
		annotation(Line(visible=true, points={{41.2, 45.8}, {43.5, 45.8}, {43.5, 45.7}, {55.1, 45.7}}, thickness=0.25));
		connect(DA.outport, DA_takeOff.u)
		annotation(Line(visible=true, points={{-105, 55.3}, {-115, 55.3}, {-115, 37}, {-124, 37}}, thickness=0.25)); 
		connect(X.outport, X_takeOff.u)
		annotation(Line(visible=true, points={{-84.3, -14.1}, {-99.5, -14.1}, {-99.5, -26}, {-112, -26}}, thickness=0.25));
		connect(X.outport, X_landing.u)
		annotation(Line(visible=true, points={{-83.7, -46.1}, {-99.5, -46.1}, {-99.5, -26}, {-112, -26}}, thickness=0.25));
		connect(DA.outport, DA_landing.u)
		annotation(Line(visible=true, points={{-105, 21.5}, {-115, 21.5}, {-115, 37}, {-124, 37}}, thickness=0.25));
		connect(condition.y, during_takeOff.condition)
		annotation(Line(visible=true, points={{-13.7, 45.9}, {-11.4, 45.9}, {-11.4, 45.9}, {-1.8, 45.9}}, thickness=0.25));
		connect(DA_takeOff.y, condition.u1)
		annotation(Line(visible=true, points={{-61.5, 55.3}, {-54.4, 55.3}, {-54.4, 45.9}, {-36.7, 45.9}}, thickness=0.25));
		connect(DA_landing.y, condition.u2)
		annotation(Line(visible=true, points={{-61.5, 21.5}, {-54, 21.5}, {-54, 37.9}, {-37, 37.9}}, thickness=0.25));
		connect(X_takeOff.y, check.u1)
		annotation(Line(visible=true, points={{-41.3, -14.1}, {-33.3, -14.1}, {-33.3, -29.1}, {-14.3, -29.1}}, thickness=0.25));
		connect(X_landing.y, check.u2)
		annotation(Line(visible=true, points={{-40.7, -46.1}, {-33.7, -46.1}, {-33.7, -37.1}, {-13.7, -37.1}}, thickness=0.25));
		connect(propertytoreal.u, during_takeOff.y)
		annotation(Line(visible=true, points={{67.1, 45.9}, {53.1, 45.9}, {53.1, 45.8}, {41.2, 45.8}}, thickness=0.25));
		connect(propertytoreal.y, property_takeOff.inport)
		annotation(Line(visible=true, points={{80.1, 45.9}, {95, 45.9}, {95, 45.6}}, thickness=0.25));     

end Req_1_OR;
 
 
 
	 
 
 
 
model Req_123 ""
  Modelica_Requirements.LogicalBlocks.WithinBand X_takeOff(u_max=400, u_min=300) annotation(Placement(visible = true, transformation(origin={-116, 33}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.LogicalBlocks.WithinBand DA_takeOff(u_max = 16, u_min = 14) annotation(Placement(visible = true, transformation(origin={-118, 98.9}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.ChecksInFixedWindow.During during_takeOff_X(check = X_takeOff.y) annotation(Placement(visible = true, transformation(origin={-43.8, 99}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.LogicalBlocks.WithinBand X_landing(u_max=700, u_min=650)  annotation(Placement(visible = true, transformation(origin={-115, 0.649}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.LogicalBlocks.WithinBand DA_landing(u_max = 36, u_min = 34)  annotation(Placement(visible = true, transformation(origin={-117, 66}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.ChecksInFixedWindow.During during_landing_X(check = X_landing.y) annotation(Placement(visible = true, transformation(origin={-43.1, 66}, extent={{-20, -10}, {20, 10}})));
      LMS.AMESim.Blocks.SignalToAMESim property_takeOff_X
				annotation (Placement(transformation(origin={64.1, 99}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalToAMESim property_landing_X
				annotation (Placement(transformation(origin={65.1, 66}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim DA
				annotation (Placement(transformation(origin={-172, 82}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim X
				annotation (Placement(transformation(origin={-180, 20}, extent={{-12, -10}, {12, 10}})));
		Modelica_AME.PropertyToReal propertytoreal
				annotation (Placement(transformation(origin={24.1, 99}, extent={{-10, -10}, {10, 10}})));
		Modelica_AME.PropertyToReal propertytoreal_1
				annotation (Placement(transformation(origin={24.1, 66}, extent={{-10, -10}, {10, 10}})));
		Modelica_Requirements.ChecksInFixedWindow.WithinDomain withindomain(polygon=[-5,  1.183333333333333; 700, 116.3333333333333; 700, 93.666666666666657; -5,   -2.683333333333334; -5,  1.183333333333333])
				annotation (Placement(transformation(origin={-74.3, -47.4}, extent={{-20, -20}, {20, 20}})));
		LMS.AMESim.Blocks.SignalToAMESim distance
				annotation (Placement(transformation(origin={1.43, -73.8}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalToAMESim property_domain
				annotation (Placement(transformation(origin={1.11, -47.4}, extent={{-12, -10}, {12, 10}})));
		 
		LMS.AMESim.Blocks.SignalFromAMESim Y
				annotation (Placement(transformation(origin={-160, -105}, extent={{-12, -10}, {12, 10}})));
		Modelica_Requirements.Sources.BooleanConstant booleanconstant
				annotation (Placement(transformation(origin={-126, -47.2}, extent={{-10, -10}, {10, 10}})));
		Modelica.Blocks.Routing.Multiplex2 multiplex2
				annotation (Placement(transformation(origin={-124, -87.3}, extent={{-10, -10}, {10, 10}})));
		Modelica_AME.PropertyToReal propertytoreal_2
				annotation (Placement(transformation(origin={-29.2, -47.3}, extent={{-10, -10}, {10, 10}})));
  Modelica_Requirements.LogicalBlocks.WithinBand Z_takeOff(u_max=-50, u_min=-150) annotation(Placement(visible = true, transformation(origin={117, -53.1}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.LogicalBlocks.WithinBand Z_landing(u_max=-320, u_min=-385)  annotation(Placement(visible = true, transformation(origin={117, -83.3}, extent={{-20, -10}, {20, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim Z
				annotation (Placement(transformation(origin={56.7, -67.6}, extent={{-12, -10}, {12, 10}})));
		Modelica_AME.PropertyToReal propertytoreal_3
				annotation (Placement(transformation(origin={29.2, 31.9}, extent={{-10, -10}, {10, 10}})));
		Modelica_AME.PropertyToReal propertytoreal_3_1
				annotation (Placement(transformation(origin={32.1, 4.33}, extent={{-10, -10}, {10, 10}})));
  Modelica_Requirements.ChecksInFixedWindow.During during_landing_X_1(check = X_landing.y) annotation(Placement(visible = true, transformation(origin={-42.4, 0.403}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.ChecksInFixedWindow.During during_takeOff_X_1(check = X_takeOff.y) annotation(Placement(visible = true, transformation(origin={-42.2, 33}, extent={{-20, -10}, {20, 10}})));
	equation
		connect(during_takeOff_X.y, propertytoreal.u)
		annotation(Line(visible=true, points={{-23, 99}, {-23, 99}, {17, 99}}, thickness=0.25));
		connect(DA_landing.y, during_landing_X.condition)
		annotation(Line(visible=true, points={{-96, 66}, {-91, 66}, {-91, 66}, {-65, 66}}, thickness=0.25));
		connect(DA_takeOff.u, DA.outport)
		annotation(Line(visible=true, points={{-140, 98.9}, {-152, 98.9}, {-152, 83}, {-162, 83}}, thickness=0.25));
		connect(X_takeOff.u, X.outport)
		annotation(Line(visible=true, points={{-138, 33}, {-150, 33}, {-150, 20}, {-170, 20}}, thickness=0.25));
		connect(during_landing_X.y, propertytoreal_1.u)
		annotation(Line(visible=true, points={{-22, 66}, {-17, 66}, {-17, 66}, {17, 66}}, thickness=0.25));
		connect(X_landing.u, X.outport)
		annotation(Line(visible=true, points={{-137, 0.65}, {-150, 0.65}, {-150, 20}, {-170, 20}}, thickness=0.25));
		connect(DA_landing.u, DA.outport)
		annotation(Line(visible=true, points={{-139, 66}, {-152, 66}, {-152, 82}, {-162, 82}}, thickness=0.25));
		connect(property_landing_X.inport, propertytoreal_1.y)
		annotation(Line(visible=true, points={{55.1, 66}, {30.1, 66}}, thickness=0.25));
		connect(DA_takeOff.y, during_takeOff_X.condition)
		annotation(Line(visible=true, points={{-97.4, 98.9}, {-97.4, 99}, {-91, 99}, {-91, 99}, {-66, 99}}, thickness=0.25));
		connect(property_takeOff_X.inport, propertytoreal.y)
		annotation(Line(visible=true, points={{54, 99}, {54, 99}, {30, 99}}, thickness=0.25));
		annotation(Diagram(coordinateSystem(extent={{-200, -125}, {200, 125}}), graphics={Text(visible=true, origin={-137, 40}, lineThickness=0.01, extent={{-50, -4}, {50, 4}}, textString="X", fontSize=6, fontName="MS Shell Dlg 2", horizontalAlignment=TextAlignment.Left),
				Text(visible=true, origin={-138, 104}, lineThickness=0.01, extent={{-50, -4}, {50, 4}}, textString="DA", fontSize=6, fontName="MS Shell Dlg 2", horizontalAlignment=TextAlignment.Left),
				Text(visible=true, origin={-135, -102}, lineThickness=0.01, extent={{-50, -4}, {50, 4}}, textString="Y", fontSize=6, fontName="MS Shell Dlg 2", horizontalAlignment=TextAlignment.Left),
				Text(visible=true, origin={83.2, -64.2}, lineThickness=0.01, extent={{-50, -4}, {50, 4}}, textString="Z", fontSize=6, fontName="MS Shell Dlg 2", horizontalAlignment=TextAlignment.Left)}));
		connect(withindomain.y, propertytoreal_2.u)
		annotation(Line(visible=true, points={{-53.3, -47.4}, {-48.3, -47.4}, {-48.3, -47.3}, {-36.2, -47.3}}, thickness=0.25));
		connect(Y.outport, multiplex2.u2[1])
		annotation(Line(visible=true, points={{-150, -105}, {-143, -105}, {-143, -93}, {-136, -93}}, thickness=0.25)); 
		connect(withindomain.point[:], multiplex2.y[:])
		annotation(Line(visible=true, points={{-96.3, -57.4}, {-106, -57.4}, {-106, -87.4}, {-113, -87.4}}, thickness=0.25));
		connect(withindomain.distance, distance.inport)
		annotation(Line(visible=true, points={{-53.3, -57.4}, {-38.3, -57.4}, {-38.3, -74.4}, {-8.27, -74.4}}, thickness=0.25));
		connect(withindomain.condition, booleanconstant.y)
		annotation(Line(visible=true, points={{-96.3, -47.3}, {-101, -47.3}, {-101, -47.2}, {-115, -47.2}}, thickness=0.25));
		connect(property_domain.inport, propertytoreal_2.y)
		annotation(Line(visible=true, points={{-8.89, -47.4}, {-14.6, -47.4}, {-14.6, -47.3}, {-23.2, -47.3}}, thickness=0.25));
		connect(X.outport, multiplex2.u1[1])
		annotation(Line(visible=true, points={{-170, 20}, {-159, 20}, {-159, -19}, {-159, -19}, {-159, -81.3}, {-136, -81.3}}, thickness=0.25));
		connect(Z_landing.u, Z.outport)
		annotation(Line(visible=true, points={{95.4, -83.3}, {80.1, -83.3}, {80.1, -67.8}, {66.3, -67.8}}, thickness=0.25));
		connect(Z_takeOff.u, Z.outport)
		annotation(Line(visible=true, points={{95.1, -53.1}, {80, -53.1}, {80, -67.6}, {67, -67.6}}, thickness=0.25));
		connect(X_landing.y, during_landing_X_1.condition)
		annotation(Line(visible=true, points={{-94.2, 0.65}, {-91, 0.65}, {-91, 0.5}, {-64.4, 0.5}}, thickness=0.25));
		connect(X_takeOff.y, during_takeOff_X_1.condition)
		annotation(Line(visible=true, points={{-95, 33}, {-64.2, 33}, {-64.2, 33}}, thickness=0.25));
	
	end Req_123;
 
 
 
 
model test_Ame_IO ""

		Modelica_Requirements.ChecksInFixedWindow.During during(check = check.y)
				annotation (Placement(transformation(origin={4.67, 37.5}, extent={{-20, -10}, {20, 10}})));
		Modelica_Requirements.LogicalBlocks.WithinBand condition(u_max=15, u_min=4)
				annotation (Placement(transformation(origin={-54.8, 47.5}, extent={{-20, -10}, {20, 10}})));
		Modelica_Requirements.LogicalBlocks.WithinBand check(u_max=15, u_min=4)
				annotation (Placement(transformation(origin={-40.1, -10.7}, extent={{-20, -10}, {20, 10}})));
		 
		 
		 
		 
		LMS.AMESim.Blocks.SignalToAMESim signaltoamesim
				annotation (Placement(transformation(origin={88.5, 37.3}, extent={{-12, -10}, {12, 10}})));
		 
		Modelica.Blocks.Sources.Step step(height=10, startTime=4)
				annotation (Placement(transformation(origin={-117, 62}, extent={{-10, -10}, {10, 10}})));
		Modelica.Blocks.Sources.Step step_1(height=10, startTime=6)
				annotation (Placement(transformation(origin={-79.9, 10.7}, extent={{-10, -10}, {10, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim signalfromamesim
				annotation (Placement(transformation(origin={-115, 25.4}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim signalfromamesim_1
				annotation (Placement(transformation(origin={-114, -11}, extent={{-12, -10}, {12, 10}})));
		Modelica_AME.PropertyToReal propertytoreal_1
				annotation (Placement(transformation(origin={56.2, 37.3}, extent={{-10, -10}, {10, 10}})));
		 
		 
		 
		 
		 
		 
		 
		 
		 
		annotation(Diagram(coordinateSystem(extent={{-150, -100}, {150, 100}})));
	equation
		  connect(condition.y, during.condition)
		annotation(Line(visible=true, points={{-17.3, 37.6}, {-26.6, 37.6}, {-26.6, 47.5}, {-33.8, 47.5}}, thickness=0.25)); 
		connect(during.y, propertytoreal_1.u)
		annotation(Line(visible=true, points={{25.7, 37.5}, {40, 37.5}, {40, 37.4}, {44.1, 37.4}}, thickness=0.25));
		connect(propertytoreal_1.y, signaltoamesim.inport)
		annotation(Line(visible=true, points={{71.7, 37.3}, {67.2, 37.3}, {67.2, 37.4}, {57.1, 37.4}}, thickness=0.25));
		connect(signalfromamesim.outport, condition.u)
		annotation(Line(visible=true, points={{-76.8, 47.5}, {-100, 47.5}, {-100, 25.4}, {-105, 25.4}}, thickness=0.25));
		connect(signalfromamesim_1.outport, check.u)
		annotation(Line(visible=true, points={{-62.1, -11}, {-91.9, -11}, {-91.9, -11}, {-104, -11}}, thickness=0.25));
		connect(during.y, propertytoreal_1.u)
		annotation(Line(visible=true, points={{25.7, 37.5}, {30.7, 37.5}, {30.7, 37.3}, {49.2, 37.3}}, thickness=0.25));
		connect(propertytoreal_1.y, signaltoamesim.inport)
		annotation(Line(visible=true, points={{62.2, 37.3}, {78.5, 37.3}, {78.5, 37.3}}, thickness=0.25));          
	

	end test_Ame_IO;
 
	model PrintViolation ""
      Modelica.Blocks.Sources.BooleanTable check(startValue = true, table = {1.5, 3.3, 4.2}) annotation(Placement(transformation(origin={-71.8, -17}, extent={{-10, -10}, {10, 10}})));
       
      Modelica_Requirements.ChecksInFixedWindow.During during1(check = check.y) annotation(Placement(transformation(origin={-25.9, -16.7}, extent={{-20, -10}, {20, 10}})));
      inner Modelica_Requirements.Verify.PrintViolations printViolations annotation(Placement(transformation(origin={57.8, 50.2}, extent={{-10, -10}, {10, 10}})));
		Modelica_Requirements.Verify.Requirement requirement(text="test requisito dummy")
				annotation (Placement(transformation(origin={53.1, -16.3}, extent={{-30, -10}, {30, 10}})));
       
       
       
       
       
       
       
       
	equation
		  connect(check.y, during1.condition)
		annotation(Line(visible=true, points={{-60.8, -17}, {-55.1, -17}, {-55.1, -17}, {-47.9, -17}}, thickness=0.25)); 
		annotation(Diagram(coordinateSystem(extent={{-100, -100}, {100, 100}})));
		connect(during1.y, requirement.property)
		annotation(Line(visible=true, points={{-4.9, -17}, {21.1, -17}, {21.1, -16.3}}, thickness=0.25)); 
	
	end PrintViolation;
	model Req_1_extended ""
  Modelica_Requirements.LogicalBlocks.WithinBand X_takeOff(u_max=400, u_min=300) annotation(Placement(visible = true, transformation(origin={-118, 13}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.LogicalBlocks.WithinBand DA_takeOff(u_max = 16, u_min = 14) annotation(Placement(visible = true, transformation(origin={-119, 79.4}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.ChecksInFixedWindow.During during_takeOff(check = X_takeOff.y) annotation(Placement(visible = true, transformation(origin={-46.4, 79.2}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.LogicalBlocks.WithinBand X_landing(u_max=700, u_min=650)  annotation(Placement(visible = true, transformation(origin={-119, -19}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.LogicalBlocks.WithinBand DA_landing(u_max = 36, u_min = 34)  annotation(Placement(visible = true, transformation(origin={-119, 46.2}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.ChecksInFixedWindow.During during_landing(check = X_landing.y) annotation(Placement(visible = true, transformation(origin={-45.4, 46.2}, extent={{-20, -10}, {20, 10}})));
      LMS.AMESim.Blocks.SignalToAMESim property_takeOff
				annotation (Placement(transformation(origin={61.6, 79.1}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalToAMESim property_landing
				annotation (Placement(transformation(origin={62.6, 46.1}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim DA
				annotation (Placement(transformation(origin={-174, 62.2}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim X
				annotation (Placement(transformation(origin={-172, -0.575}, extent={{-12, -10}, {12, 10}})));
		Modelica_AME.PropertyToReal propertytoreal
				annotation (Placement(transformation(origin={21.4, 79}, extent={{-10, -10}, {10, 10}})));
		Modelica_AME.PropertyToReal propertytoreal_1
				annotation (Placement(transformation(origin={22, 46.1}, extent={{-10, -10}, {10, 10}})));
	equation
		connect(DA_landing.y, during_landing.condition)
		annotation(Line(visible=true, points={{-98.1, 46.2}, {-93.1, 46.2}, {-93.1, 46.3}, {-67.4, 46.3}}, thickness=0.25));
		connect(DA_takeOff.y, during_takeOff.condition)
		annotation(Line(visible=true, points={{-98.1, 79.4}, {-93.1, 79.4}, {-93.1, 79.3}, {-68.1, 79.3}}, thickness=0.25));
		connect(during_landing.y, propertytoreal_1.u)
		annotation(Line(visible=true, points={{-24.4, 46.2}, {-19.4, 46.2}, {-19.4, 46.1}, {15, 46.1}}, thickness=0.25));
		connect(during_takeOff.y, propertytoreal.u)
		annotation(Line(visible=true, points={{-25.4, 79.2}, {-25.4, 79}, {14.6, 79}}, thickness=0.25));
		connect(X_takeOff.u, X.outport)
		annotation(Line(visible=true, points={{-140, 13}, {-152, 13}, {-152, 0.02}, {-162, 0.02}}, thickness=0.25));
		connect(property_takeOff.inport, propertytoreal.y)
		annotation(Line(visible=true, points={{51.6, 79.1}, {51.6, 79}, {27.6, 79}}, thickness=0.25));
		connect(X_landing.u, X.outport)
		annotation(Line(visible=true, points={{-141, -19}, {-152, -19}, {-152, 0.02}, {-162, 0.02}}, thickness=0.25));
		connect(property_landing.inport, propertytoreal_1.y)
		annotation(Line(visible=true, points={{52.6, 46.1}, {28, 46.1}}, thickness=0.25));
		connect(DA_landing.u, DA.outport)
		annotation(Line(visible=true, points={{-141, 46.2}, {-154, 46.2}, {-154, 62.2}, {-164, 62.2}}, thickness=0.25));
		connect(DA_takeOff.u, DA.outport)
		annotation(Line(visible=true, points={{-141, 79.4}, {-154, 79.4}, {-154, 62.5}, {-164, 62.5}}, thickness=0.25));
		annotation(Diagram(coordinateSystem(extent={{-200, -100}, {200, 100}}), graphics={Text(visible=true, origin={-141, 21.2}, lineThickness=0.01, extent={{-50, -4}, {50, 4}}, textString="X", fontSize=6, fontName="MS Shell Dlg 2", horizontalAlignment=TextAlignment.Left),
				Text(visible=true, origin={-141, 90.2}, lineThickness=0.01, extent={{-50, -4}, {50, 4}}, textString="DA", fontSize=6, fontName="MS Shell Dlg 2", horizontalAlignment=TextAlignment.Left)}));
	
	end Req_1_extended;
	 
 
model Req_1 ""
   
 Modelica_Requirements.LogicalBlocks.WithinBand X_takeOff(u_max=400, u_min=300) annotation(Placement(visible = true, transformation(origin={-72, -17.7}, extent={{-20, -10}, {20, 10}})));
 Modelica_Requirements.LogicalBlocks.WithinBand DA_takeOff(u_max = 16, u_min = 14) annotation(Placement(visible = true, transformation(origin={-73, 48.7}, extent={{-20, -10}, {20, 10}})));
 
 Modelica_Requirements.ChecksInFixedWindow.During during_takeOff(check = X_takeOff.y) annotation(Placement(visible = true, transformation(origin={0.1, 48.5}, extent={{-20, -10}, {20, 10}})));
 
 Modelica_Requirements.LogicalBlocks.WithinBand X_landing(u_max=700, u_min=650)  annotation(Placement(visible = true, transformation(origin={-73, -49.7}, extent={{-20, -10}, {20, 10}})));
 Modelica_Requirements.LogicalBlocks.WithinBand DA_landing(u_max = 36, u_min = 34)  annotation(Placement(visible = true, transformation(origin={-73, 15.5}, extent={{-20, -10}, {20, 10}})));

 Modelica_Requirements.ChecksInFixedWindow.During during_landing(check = X_landing.y) annotation(Placement(visible = true, transformation(origin={0.8, 15.5}, extent={{-20, -10}, {20, 10}})));
      
      LMS.AMESim.Blocks.SignalToAMESim property_takeOff
				annotation (Placement(transformation(origin={108, 48.4}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalToAMESim property_landing
				annotation (Placement(transformation(origin={109, 15.4}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim DA
				annotation (Placement(transformation(origin={-128, 31.5}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim X
				annotation (Placement(transformation(origin={-126, -31.3}, extent={{-12, -10}, {12, 10}})));
		Modelica_AME.PropertyToReal propertytoreal
				annotation (Placement(transformation(origin={67.8, 48.3}, extent={{-10, -10}, {10, 10}})));
		Modelica_AME.PropertyToReal propertytoreal_1
				annotation (Placement(transformation(origin={68.4, 15.4}, extent={{-10, -10}, {10, 10}})));
	equation
		connect(DA_takeOff.y, during_takeOff.condition)
		annotation(Line(visible=true, points={{-52, 48.7}, {-47, 48.7}, {-47, 48.6}, {-22, 48.6}}, thickness=0.25));
		connect(X_takeOff.u, X.outport)
		annotation(Line(visible=true, points={{-94, -18}, {-106, -18}, {-106, -31}, {-116, -31}}, thickness=0.25));
		connect(DA_takeOff.u, DA.outport)
		annotation(Line(visible=true, points={{-95, 48.7}, {-108, 48.7}, {-108, 31.5}, {-118, 31.5}}, thickness=0.25));
		connect(property_landing.inport, propertytoreal_1.y)
		annotation(Line(visible=true, points={{99, 15.4}, {74.4, 15.4}}, thickness=0.25));
		connect(during_takeOff.y, propertytoreal.u)
		annotation(Line(visible=true, points={{21, 48.5}, {21, 48.3}, {61, 48.3}}, thickness=0.25));
		connect(property_takeOff.inport, propertytoreal.y)
		annotation(Line(visible=true, points={{98, 48.4}, {98, 48.3}, {74, 48.3}}, thickness=0.25));
		connect(during_landing.y, propertytoreal_1.u)
		annotation(Line(visible=true, points={{22, 15.5}, {46, 15.5}, {46, 15.4}, {61, 15.4}}, thickness=0.25));
		connect(DA_landing.u, DA.outport)
		annotation(Line(visible=true, points={{-95, 15.5}, {-108, 15.5}, {-108, 31.5}, {-118, 31.5}}, thickness=0.25));
		connect(X_landing.u, X.outport)
		annotation(Line(visible=true, points={{-95, -50}, {-106, -50}, {-106, -31}, {-116, -31}}, thickness=0.25));
		connect(DA_landing.y, during_landing.condition)
		annotation(Line(visible=true, points={{-52, 15.5}, {-47, 15.5}, {-47, 15.6}, {-21, 15.6}}, thickness=0.25));
		annotation(Diagram(coordinateSystem(extent={{-150, -100}, {150, 100}}), graphics={Text(visible=true, origin={143, 33.8}, lineThickness=0.01, extent={{-50, -3}, {50, 3}}, textString="property_X_takeOff", fontSize=4.5, fontName="MS Shell Dlg 2", horizontalAlignment=TextAlignment.Left),
				Text(visible=true, origin={144, -1}, lineThickness=0.01, extent={{-50, -3}, {50, 3}}, textString="property_X_landing", fontSize=4.5, fontName="MS Shell Dlg 2", horizontalAlignment=TextAlignment.Left),
				Text(visible=true, origin={-86, 15.4}, lineThickness=0.01, extent={{-50, -3}, {50, 3}}, textString="DA(t)", fontSize=4.5, fontName="MS Shell Dlg 2", horizontalAlignment=TextAlignment.Left),
				Text(visible=true, origin={-84, -46}, lineThickness=0.01, extent={{-50, -3}, {50, 3}}, textString="X(t)", fontSize=4.5, fontName="MS Shell Dlg 2", horizontalAlignment=TextAlignment.Left)}));

end Req_1;
	model Req_2 ""
		Modelica_Requirements.ChecksInFixedWindow.WithinDomain withindomain(polygon=[-5,  1.183333333333333; 700, 116.3333333333333; 700, 93.666666666666657; -5,   -2.683333333333334; -5,  1.183333333333333])
				annotation (Placement(transformation(origin={22.8, 16.4}, extent={{-20, -20}, {20, 20}})));

		 
		LMS.AMESim.Blocks.SignalToAMESim property_domain
				annotation (Placement(transformation(origin={99, 16.9}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim X
				annotation (Placement(transformation(origin={-99.2, 24.8}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim Y
				annotation (Placement(transformation(origin={-99.4, -15.1}, extent={{-12, -10}, {12, 10}})));


		Modelica_Requirements.Sources.BooleanConstant booleanconstant
				annotation (Placement(transformation(origin={-26.2, 32.5}, extent={{-10, -10}, {10, 10}})));
		Modelica.Blocks.Routing.Multiplex2 multiplex2
				annotation (Placement(transformation(origin={-63.9, 6.4}, extent={{-10, -10}, {10, 10}})));
		Modelica_AME.PropertyToReal propertytoreal
				annotation (Placement(transformation(origin={66.2, 16.5}, extent={{-10, -10}, {10, 10}})));
		annotation(Diagram(coordinateSystem(extent={{-125, -80}, {125, 80}}), graphics={Text(visible=true, origin={-59.7, -31.4}, lineThickness=0.01, extent={{-50, -3}, {50, 3}}, textString="Y(t)", fontSize=4.5, fontName="MS Shell Dlg 2", horizontalAlignment=TextAlignment.Left),
				Text(visible=true, origin={-58.5, 9.4}, lineThickness=0.01, extent={{-50, -3}, {50, 3}}, textString="X(t)", fontSize=4.5, fontName="MS Shell Dlg 2", horizontalAlignment=TextAlignment.Left),
				Text(visible=true, origin={128, -1.82}, lineThickness=0.01, extent={{-50, -3}, {50, 3}}, textString="property_Y", fontSize=4.5, fontName="MS Shell Dlg 2", horizontalAlignment=TextAlignment.Left),
				Text(visible=true, origin={-59.6, 56}, lineThickness=0.01, textColor={0, 128, 0}, extent={{-50, -2.5}, {50, 2.5}}, textString="HLD status to be verified", fontSize=3.75, fontName="MS Shell Dlg 2", horizontalAlignment=TextAlignment.Left),
				Text(visible=true, origin={38.9, 55.9}, lineThickness=0.01, textColor={0, 128, 0}, extent={{-50, -2.5}, {50, 2.5}}, textString="Requirements definition", fontSize=3.75, fontName="MS Shell Dlg 2", horizontalAlignment=TextAlignment.Left)}));
	equation
		connect(X.outport, multiplex2.u1[1])
		annotation(Line(visible=true, points={{-89.2, 24.8}, {-84.2, 24.8}, {-84.2, 12.4}, {-75.9, 12.4}}, thickness=0.25));
		connect(Y.outport, multiplex2.u2[1])
		annotation(Line(visible=true, points={{-89.4, -15.2}, {-83.8, -15.2}, {-83.8, 0.4}, {-75.9, 0.4}}, thickness=0.25));
		connect(multiplex2.y[:], withindomain.point[:])
		annotation(Line(visible=true, points={{0.85, 6.38}, {-21, 6.38}, {-21, 6.4}, {-52.9, 6.4}}, thickness=0.25));
	
	   connect(booleanconstant.y, withindomain.condition)
		annotation(Line(visible=true, points={{0.85, 16.5}, {-8.2, 16.5}, {-8.2, 32.5}, {-15.2, 32.5}}, thickness=0.25));
		connect(withindomain.y, propertytoreal.u)
		annotation(Line(visible=true, points={{26.9, 8.23}, {31.9, 8.23}, {31.9, 8.22}, {39.5, 8.22}}, thickness=0.25));
		connect(propertytoreal.y, property_domain.inport)
		annotation(Line(visible=true, points={{71.4, 8.12}, {57.4, 8.12}, {57.4, 8.22}, {52.4, 8.22}}, thickness=0.25)); 
		connect(propertytoreal.u, withindomain.y)
		annotation(Line(visible=true, points={{43.8, 16.4}, {54.1, 16.4}, {54.1, 16.5}, {59.1, 16.5}}, thickness=0.25));
		connect(propertytoreal.y, property_domain.inport)
		annotation(Line(visible=true, points={{89, 16.9}, {89, 16.5}, {72, 16.5}}, thickness=0.25)); 
		
	end Req_2;
model Req_3 ""

  Modelica_Requirements.LogicalBlocks.WithinBand Z_takeOff(u_max=-50, u_min=-150) annotation(Placement(visible = true, transformation(origin={-77.4, -35.1}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.LogicalBlocks.WithinBand X_takeOff(u_max = 400, u_min = 300) annotation(Placement(visible = true, transformation(origin={-80, 45.9}, extent={{-20, -10}, {20, 10}})));   
  Modelica_Requirements.ChecksInFixedWindow.During during_takeOff(check = Z_takeOff.y) annotation(Placement(visible = true, transformation(origin={3.08, 45.7}, extent={{-20, -10}, {20, 10}}))); 
 
  Modelica_Requirements.LogicalBlocks.WithinBand Z_landing(u_max=-320, u_min=-385)  annotation(Placement(visible = true, transformation(origin={-78.2, -67.1}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.LogicalBlocks.WithinBand X_landing(u_max = 700, u_min = 650)  annotation(Placement(visible = true, transformation(origin={-77.6, 8.86}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.ChecksInFixedWindow.During during_landing(check = Z_landing.y) annotation(Placement(visible = true, transformation(origin={3.78, 8.83}, extent={{-20, -10}, {20, 10}})));
		
      LMS.AMESim.Blocks.SignalToAMESim property_takeOff
				annotation (Placement(transformation(origin={105, 45.6}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalToAMESim property_landing
				annotation (Placement(transformation(origin={106, 8.75}, extent={{-12, -10}, {12, 10}})));

		LMS.AMESim.Blocks.SignalFromAMESim X
				annotation (Placement(transformation(origin={-133, 26.9}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim Z
				annotation (Placement(transformation(origin={-132, -50.2}, extent={{-12, -10}, {12, 10}})));
		Modelica_AME.PropertyToReal propertytoreal
				annotation (Placement(transformation(origin={53.2, 45.5}, extent={{-10, -10}, {10, 10}})));
		Modelica_AME.PropertyToReal propertytoreal_1
				annotation (Placement(transformation(origin={53.7, 9.06}, extent={{-10, -10}, {10, 10}})));
      
		
		 
equation
    annotation(uses(Modelica(version = "3.2.1"), Modelica_Requirements(version = "0.10")), experiment(StartTime = 0, StopTime = 6, Tolerance = 1e-06, Interval = 0.012), Diagram(coordinateSystem(extent={{-150, -100}, {150, 100}}), graphics={Text(visible=true, origin={144, 29.7}, lineThickness=0.01, extent={{-50, -3}, {50, 3}}, textString="property_Z_takeOff", fontSize=4.5, fontName="MS Shell Dlg 2", horizontalAlignment=TextAlignment.Left),
				Text(visible=true, origin={144, -8}, lineThickness=0.01, extent={{-50, -3}, {50, 3}}, textString="property_Z_landing", fontSize=4.5, fontName="MS Shell Dlg 2", horizontalAlignment=TextAlignment.Left),
				Text(visible=true, origin={-88.2, -66.6}, lineThickness=0.01, extent={{-50, -3}, {50, 3}}, textString="Z(t)", fontSize=4.5, fontName="MS Shell Dlg 2", horizontalAlignment=TextAlignment.Left),
				Text(visible=true, origin={-88.7, 10.2}, lineThickness=0.01, extent={{-50, -3}, {50, 3}}, textString="X(t)", fontSize=4.5, fontName="MS Shell Dlg 2", horizontalAlignment=TextAlignment.Left)}));
		connect(X.outport, X_takeOff.u)
		annotation(Line(visible=true, points={{-123, 26.9}, {-108, 26.9}, {-108, 45.9}, {-102, 45.9}}, thickness=0.25));
		connect(X.outport, X_landing.u)
		annotation(Line(visible=true, points={{-123, 26.9}, {-108, 26.9}, {-108, 8.86}, {-99.6, 8.86}}, thickness=0.25));
		connect(Z.outport, Z_takeOff.u)
		annotation(Line(visible=true, points={{-99.4, -35.1}, {-111, -35.1}, {-111, -50.2}, {-122, -50.2}}, thickness=0.25));
		connect(Z.outport, Z_landing.u)
		annotation(Line(visible=true, points={{-100, -67.1}, {-111, -67.1}, {-111, -50.2}, {-122, -50.2}}, thickness=0.25));
		connect(X_landing.y, during_landing.condition)
		annotation(Line(visible=true, points={{-56.6, 8.86}, {-18.2, 8.86}, {-18.2, 8.93}}, thickness=0.25));
		connect(X_takeOff.y, during_takeOff.condition)
		annotation(Line(visible=true, points={{-59, 45.9}, {-18.9, 45.9}, {-18.9, 45.8}}, thickness=0.25));
		connect(during_takeOff.y, propertytoreal.u)
		annotation(Line(visible=true, points={{24.1, 45.7}, {46.2, 45.7}, {46.2, 45.5}}, thickness=0.25));
		connect(propertytoreal.y, property_takeOff.inport)
		annotation(Line(visible=true, points={{59.2, 45.5}, {95, 45.5}, {95, 45.6}}, thickness=0.25));
		connect(propertytoreal_1.y, property_landing.inport)
		annotation(Line(visible=true, points={{59.7, 9.06}, {96, 9.06}, {96, 8.75}}, thickness=0.25));
		connect(during_landing.y, propertytoreal_1.u)
		annotation(Line(visible=true, points={{24.8, 8.83}, {46.7, 8.83}, {46.7, 9.06}}, thickness=0.25)); 
	
		

	end Req_3;
	 
 
	model Req_5 ""
		
      LMS.AMESim.Blocks.SignalToAMESim property_FH
				annotation (Placement(transformation(origin={67.8, -8.73}, extent={{-12, -10}, {12, 10}})));
				
	   LMS.AMESim.Blocks.SignalFromAMESim FH
				annotation (Placement(transformation(origin={-73.6, -8.34}, extent={{-12, -10}, {12, 10}})));
				
		Modelica_Requirements.LogicalBlocks.LessEqualThreshold lessequalthreshold(threshold=0.9)
				annotation (Placement(transformation(origin={-9.8, -8.36}, extent={{-10, -10}, {10, 10}})));
		Modelica_AME.BooleanToReal booleantoreal
				annotation (Placement(transformation(origin={39.3, -8.51}, extent={{-10, -10}, {10, 10}})));
	equation
		connect(lessequalthreshold.u, FH.outport)
		annotation(Line(visible=true, points={{-63.6, -8}, {-63.6, -8.36}, {-31.8, -8.36}}, thickness=0.25));
		connect(property_FH.inport, booleantoreal.y)
		annotation(Line(visible=true, points={{57.8, -8.73}, {45.3, -8.73}, {45.3, -8.52}}, thickness=0.25));
		connect(lessequalthreshold.y, booleantoreal.u)
		annotation(Line(visible=true, points={{11.2, -8.36}, {32, -8.36}, {32, -9}}, thickness=0.25));
		annotation(Diagram(coordinateSystem(extent={{-100, -100}, {100, 100}})));
	
	end Req_5;
	model Req_6 ""
		
      LMS.AMESim.Blocks.SignalToAMESim property_Tmg
				annotation (Placement(transformation(origin={71.5, 14}, extent={{-12, -10}, {12, 10}})));
				
		LMS.AMESim.Blocks.SignalFromAMESim Tmg
				annotation (Placement(transformation(origin={-69.9, 14.4}, extent={{-12, -10}, {12, 10}})));
				
		Modelica_Requirements.LogicalBlocks.LessEqualThreshold lessequalthreshold(threshold=600)
				annotation (Placement(transformation(origin={-8.54, 14.4}, extent={{-10, -10}, {10, 10}})));
		Modelica_AME.BooleanToReal booleantoreal
				annotation (Placement(transformation(origin={43, 14.2}, extent={{-10, -10}, {10, 10}})));
	equation
		connect(property_Tmg.inport, booleantoreal.y)
		annotation(Line(visible=true, points={{61.5, 14}, {56.5, 14}, {56.5, 14.2}, {49, 14.2}}, thickness=0.25));
		connect(Tmg.outport, lessequalthreshold.u)
		annotation(Line(visible=true, points={{-59.9, 14.4}, {-30.5, 14.4}}, thickness=0.25));
		connect(lessequalthreshold.y, booleantoreal.u)
		annotation(Line(visible=true, points={{12.5, 14.4}, {35.5, 14.4}, {35.5, 13.4}}, thickness=0.25));
		annotation(Diagram(coordinateSystem(extent={{-100, -100}, {100, 100}})));
	
	end Req_6;
model Stampa ""

  Modelica_Requirements.LogicalBlocks.WithinBand X_takeOff(u_max=400, u_min=300) annotation(Placement(visible = true, transformation(origin={-37.6, -36.7}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.LogicalBlocks.WithinBand DA_takeOff(u_max = 16, u_min = 14) annotation(Placement(visible = true, transformation(origin={-37.9, 5.28}, extent={{-20, -10}, {20, 10}})));
  Modelica_Requirements.ChecksInFixedWindow.During during_takeOff(check = X_takeOff.y) annotation(Placement(visible = true, transformation(origin={25.2, 5.08}, extent={{-20, -10}, {20, 10}})));
   
   
   
      LMS.AMESim.Blocks.SignalToAMESim property_takeOff
				annotation (Placement(transformation(origin={118, 5.18}, extent={{-12, -10}, {12, 10}})));
		 
		LMS.AMESim.Blocks.SignalFromAMESim DA
				annotation (Placement(transformation(origin={-110, 5.38}, extent={{-12, -10}, {12, 10}})));
		LMS.AMESim.Blocks.SignalFromAMESim X
				annotation (Placement(transformation(origin={-111, -36.7}, extent={{-12, -10}, {12, 10}})));
		Modelica_AME.PropertyToReal propertytoreal
				annotation (Placement(transformation(origin={76.5, 4.88}, extent={{-10, -10}, {10, 10}})));
		Modelica_AME.Requirement requirement(text="22222")
				annotation (Placement(transformation(origin={48.5, -28}, extent={{-30, -10}, {30, 10}})));
		 
	equation
		 connect(DA_takeOff.y, during_takeOff.condition)
		annotation(Line(visible=true, points={{-16.9, 5.28}, {-30.9, 5.28}, {-30.9, 5.18}, {3.16, 5.18}}, thickness=0.25)); 
		connect(during_takeOff.y, propertytoreal.u)
		annotation(Line(visible=true, points={{46.2, 5.08}, {46.2, 4.88}, {70.2, 4.88}}, thickness=0.25));
		connect(X_takeOff.u, X.outport)
		annotation(Line(visible=true, points={{-59.6, -36.7}, {-101, -36.7}}, thickness=0.25));  
		connect(DA_takeOff.u, DA.outport)
		annotation(Line(visible=true, points={{-59.9, 5.28}, {-92.2, 5.28}, {-92.2, 5.38}, {-100, 5.38}}, thickness=0.25));
		annotation(Diagram(coordinateSystem(extent={{-138, -55}, {138, 55}}), graphics={Text(visible=true, origin={-79.4, -17}, lineThickness=0.01, extent={{-50, -2.67}, {50, 2.67}}, textString="X(t)", fontSize=4, fontName="MS Shell Dlg 2", horizontalAlignment=TextAlignment.Left),
				Text(visible=true, origin={-78.7, 31.1}, lineThickness=0.01, extent={{-50, -2.67}, {50, 2.67}}, textString="DA(t)", fontSize=4, fontName="MS Shell Dlg 2", horizontalAlignment=TextAlignment.Left),
				Text(visible=true, origin={-80.5, 45.2}, lineThickness=0.01, textColor={0, 128, 0}, extent={{-50, -2.67}, {50, 2.67}}, textString="HLD status to be verified", fontSize=4, fontName="MS Shell Dlg 2", horizontalAlignment=TextAlignment.Left),
				Text(visible=true, origin={18.2, 45.1}, lineThickness=0.01, textColor={0, 128, 0}, extent={{-50, -2.67}, {50, 2.67}}, textString="Requirements definition", fontSize=4, fontName="MS Shell Dlg 2", horizontalAlignment=TextAlignment.Left)}));
		connect(property_takeOff.inport, propertytoreal.y)
		annotation(Line(visible=true, points={{108, 5.18}, {82.8, 5.18}, {82.8, 4.88}}, thickness=0.25));
	

	end Stampa;
	 
   
 
	 
 
	 
 
 
 
 
	 
 
	 
	 
 
	
end Modelica_AME;