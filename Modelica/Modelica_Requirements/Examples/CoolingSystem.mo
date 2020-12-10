within Modelica_Requirements.Examples;
package CoolingSystem
  "Example package to evaluate the requirements of the EDF Cooling System benchmark (using a graphical definition)"
   extends Modelica.Icons.ExamplesPackage;
   package Components "Utility components needed for Cooling System example"
       extends Modelica.Icons.UtilitiesPackage;

     block TriggeredTable
      "Dummy model for evaluation (the Boolean input enable is currently ignored)"
       extends Modelica.Blocks.Tables.CombiTable1D;
       Modelica.Blocks.Interfaces.BooleanInput enable annotation (Placement(
             transformation(
             extent={{-20,-20},{20,20}},
             rotation=90,
             origin={0,-120})));
     end TriggeredTable;

     block PumpCavitationRequirement
      "Define requirement that a pump in operation shall not cavitate"
       extends Modelica.Blocks.Icons.Block;
      ChecksInFixedWindow.During
                 during(check=cavitate)
        annotation (Placement(transformation(extent={{-40,0},{0,20}})));
       Verify.Requirement R2_pump(text=
             "When a pump is in operation, it should not cavitate’")
         annotation (Placement(transformation(extent={{20,0},{80,20}})));
       Modelica.Blocks.Interfaces.BooleanInput inOperation
        "Verify check as long as condition = true"
         annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
       Modelica.Blocks.Interfaces.BooleanInput cavitate
        "As long as condition is true, check should be true"  annotation (
           Placement(transformation(extent={{-140,-80},{-100,-40}})));
     equation

       connect(during.y, R2_pump.property) annotation (Line(
           points={{1,10},{18,10}},
           color={255,0,128},
           smooth=Smooth.None));
       connect(during.condition, inOperation) annotation (Line(
           points={{-42,10.1},{-62,10.1},{-62,60},{-120,60}},
           color={255,0,255},
           smooth=Smooth.None));
       annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent=
                 {{-100,-100},{100,100}}), graphics), Icon(coordinateSystem(
               preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
             graphics={Text(
               extent={{-86,68},{48,54}},
               lineColor={0,0,0},
               textString="inOperation",
               horizontalAlignment=TextAlignment.Left), Text(
               extent={{-82,-54},{52,-68}},
               lineColor={0,0,0},
               textString="cavitate",
               horizontalAlignment=TextAlignment.Left)}));
     end PumpCavitationRequirement;

     record PumpObservation
      "Signals observed from a Pump as needed by PumpRequirements block"
        extends Modelica_Requirements.Interfaces.PartialWatching;

        Real q "Volumetric flow rate" annotation(Dialog);

        Real pInlet "Pressure at the inlet of the pump" annotation(Dialog);

     end PumpObservation;

     record PumpExternalData
      "Data needed for a pump but usually not available in the behavioral pump model"
        extends Modelica.Icons.Record;
        parameter Real qt "Volumetric flow rate threshold";
        parameter Real NPSH_req[:,2] "NPSH table";
     end PumpExternalData;

     block PumpRequirements "Requirements for one pumpe"
       extends Modelica_Requirements.Interfaces.PartialRequirements;

       input PumpObservation observation "Signals observed from pump"
         annotation (Dialog, Placement(transformation(extent={{-70,80},{-50,100}})));

       parameter PumpExternalData data "External pump data"
         annotation (Placement(transformation(extent={{-40,80},{-20,100}})));
       Sources.RealExpression pInlet(y=observation.pInlet)
         annotation (Placement(transformation(extent={{-100,40},{-60,60}})));
       Sources.RealExpression q(y=observation.q)
         annotation (Placement(transformation(extent={{-100,-30},{-60,-10}})));
       LogicalBlocks.GreaterThreshold gt(threshold=data.qt)
         annotation (Placement(transformation(extent={{-40,-30},{-10,-10}})));
       TriggeredTable NPSH_Table(table=data.NPSH_req)
         annotation (Placement(transformation(extent={{0,0},{20,20}})));
       Modelica.Blocks.Logical.Less cavitating
         annotation (Placement(transformation(extent={{20,40},{40,60}})));
       PumpCavitationRequirement pumpCavitationRequirement
         annotation (Placement(transformation(extent={{60,20},{80,0}})));
     equation
       connect(q.y, gt.u) annotation (Line(
           points={{-59,-20},{-41.5,-20}},
           color={0,0,127},
           smooth=Smooth.None));
       connect(q.y, NPSH_Table.u[1]) annotation (Line(
           points={{-59,-20},{-52,-20},{-52,10},{-2,10}},
           color={0,0,127},
           smooth=Smooth.None));
       connect(gt.y, NPSH_Table.enable) annotation (Line(
           points={{-9.25,-20},{10,-20},{10,-2}},
           color={255,0,255},
           smooth=Smooth.None));
       connect(pInlet.y, cavitating.u1) annotation (Line(
           points={{-59,50},{18,50}},
           color={0,0,127},
           smooth=Smooth.None));
       connect(NPSH_Table.y[1], cavitating.u2) annotation (Line(
           points={{21,10},{28,10},{28,34},{10,34},{10,42},{18,42}},
           color={0,0,127},
           smooth=Smooth.None));
       connect(cavitating.y, pumpCavitationRequirement.cavitate) annotation (Line(
           points={{41,50},{46,50},{46,16},{58,16}},
           color={255,0,255},
           smooth=Smooth.None));
       connect(gt.y, pumpCavitationRequirement.inOperation) annotation (Line(
           points={{-9.25,-20},{46,-20},{46,4},{58,4}},
           color={255,0,255},
           smooth=Smooth.None));
       annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                 -100},{100,100}}),        graphics));
     end PumpRequirements;

     block Pump_A "Architectural model of a pump"
       extends Modelica.Blocks.Icons.Block;
       parameter String id;
       input Real NPSH_req[:,2];

       annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                 -100,-100},{100,100}}), graphics={Text(
               extent={{-90,15},{90,-15}},
               lineColor={0,0,0},
               textString="%id")}));
     end Pump_A;

     block CoolingSystem_A1 "Architectural model of cooling system"
       extends Modelica.Blocks.Icons.Block;

       Pump_A pump1(id="PO1")
         annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
       Pump_A pump2(id="PO2")
         annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
       Pump_A pump3(id="PO3")
         annotation (Placement(transformation(extent={{0,40},{20,60}})));
     end CoolingSystem_A1;

   end Components;
end CoolingSystem;
