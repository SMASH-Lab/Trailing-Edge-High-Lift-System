within Modelica_Requirements;
package OverlappingTimePeriods
  "Library of blocks that inspect a property in overlapping time periods"
  extends Modelica.Icons.Package;
  constant Integer nMaxPeriods = 5 "Default maximum number of overlapping time periods";

  package TimeLocators
    "Library of continuous time locators for overlapping time periods (outputs are true, if within time locator)"
    block Always "Outputs are always true"
      extends Interfaces.PartialNumberOfPeriods;
      Interfaces.BooleanSetOutput y[nPeriods] "y[i] = true"
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));
    equation
      y = fill(true, nPeriods);
      annotation (defaultComponentName="always1", Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={1,1})), Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={
            Rectangle(
              extent={{-100,50},{100,-50}},
              lineColor={0,0,0},
              lineThickness=5.0,
              fillColor={210,210,210},
              fillPattern=FillPattern.Solid,
              borderPattern=BorderPattern.Raised),
            Text(
              extent={{-150,100},{150,60}},
              lineColor={175,175,175},
              textString="%name"), Polygon(
              points={{-71,36},{-79,14},{-63,14},{-71,36}},
              lineColor={135,135,135},
              fillColor={135,135,135},
              fillPattern=FillPattern.Solid),Line(points={{-71,36},{-71,-36}},
              color={135,135,135}),          Line(points={{-79,-28},{73,-28}},
              color={135,135,135}),          Polygon(
              points={{83,-28},{61,-20},{61,-36},{83,-28}},
              lineColor={135,135,135},
              fillColor={135,135,135},
              fillPattern=FillPattern.Solid),
            Line(points={{-71,3},{62,3}}, color={255,0,255})}),
        Documentation(info="<html>
<h4>Syntax</h4>

<blockquote><p>
condition = <b>AfterFor</b>(u=..., duration=...).y;
</p></blockquote>

<h4>Description</h4>

<p>
This block sets all outputs to true: <b>y[i]</b> = true.
</p>

<h4>Example</h4>

<p>
This block is demonstrated with the following
<a href=\"modelica://Modelica_Requirements.Examples.Elementary.OverlappingTimePeriods.TimeLocators.Always\">example</a>: 
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Requirements/Resources/Images/Examples/Elementary/OverlappingTimePeriods/TimeLocators/Always1.png\">
</blockquote></p>

<p>
results in
</p>


<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Requirements/Resources/Images/Examples/Elementary/OverlappingTimePeriods/TimeLocators/Always2.png\"></td></tr>
<tr><td></td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>
</html>"));
    end Always;

    block Assign "Output y[1] = u, all other outputs y[2:end] = false"
      extends Interfaces.PartialNumberOfPeriods;
      Modelica.Blocks.Interfaces.BooleanInput u annotation (Placement(
            transformation(extent={{-90,-20},{-50,20}}), iconTransformation(extent={
                {-90,-20},{-50,20}})));
      Interfaces.BooleanSetOutput y[nPeriods] "y[1] = u, y[2:end] = false"
        annotation (Placement(transformation(extent={{50,-10},{70,10}}),
            iconTransformation(extent={{50,-10},{70,10}})));
    equation
      y[1] = u;
      y[2:end] = fill(false,nPeriods-1);

      annotation (defaultComponentName="assign1",Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={
            Rectangle(
              extent={{-50,50},{50,-50}},
              lineColor={0,0,0},
              lineThickness=5.0,
              fillColor={210,210,210},
              fillPattern=FillPattern.Solid,
              borderPattern=BorderPattern.Raised), Text(
              extent={{-150,100},{150,60}},
              lineColor={175,175,175},
              textString="%name"),
            Line(points={{-46,12},{45,12}}, color={255,0,255}),
            Line(points={{15,-6},{45,-6}}, color={255,0,255}),
            Line(points={{15,-23},{45,-23}}, color={255,0,255})}),
                                     Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={1,1})),
        Documentation(info="<html>
<h4>Syntax</h4>

<blockquote><p>
condition = <b>Assign</b>(u=...).y;
</p></blockquote>

<h4>Description</h4>

<p>
This block sets its first output to its Boolean input: <b>y[1]</b> = u.<br>
All other outputs are set to false: <b>y[i]</b> = false, for i &gt; 1.<br>
Therefore, this block allows to use any block with a Boolean output as condition for a check block with 
overlapping time periods.
</p>

<h4>Example</h4>

<p>
This block is demonstrated with the following
<a href=\"modelica://Modelica_Requirements.Examples.Elementary.OverlappingTimePeriods.TimeLocators.Assign\">example</a>: 
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Requirements/Resources/Images/Examples/Elementary/OverlappingTimePeriods/TimeLocators/Assign1.png\">
</blockquote></p>

<p>
results in
</p>


<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Requirements/Resources/Images/Examples/Elementary/OverlappingTimePeriods/TimeLocators/Assign2.png\"></td></tr>
<tr><td></td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>
</html>"));
    end Assign;
    extends Modelica.Icons.Package;

    block After "Outputs are true, after a rising edge of the input"
      import Modelica_Requirements.LogicalFunctions.forall;
      extends Interfaces.PartialNumberOfPeriods;
      input Boolean u "Boolean input" annotation(Dialog);
      Interfaces.BooleanSetOutput y[nPeriods]
        "y[i] = true after i-th rising edge of u"
        annotation (Placement(transformation(extent={{200,-10},{220,10}})));
    initial equation
      y[1]     = u;
      y[2:end] = fill(false,nPeriods-1);
    algorithm
      when u and not terminal() then
        assert(not forall(pre(y)), "Number of detected periods for Continuous Time Locators is above the maximum limit (= " + String(nPeriods) +")");
        for i in 1:nPeriods loop
            if not pre(y[i]) then
               y[i] := true;
               break;
            end if;
        end for;
      end when;

      annotation (defaultComponentName="after1",
           Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-200,-100},{200,100}},
            grid={1,1})), Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-200,-100},{200,100}},
            grid={1,1}), graphics={
            Rectangle(
              extent={{-200,50},{200,-50}},
              lineColor={0,0,0},
              lineThickness=5.0,
              fillColor={210,210,210},
              fillPattern=FillPattern.Solid,
              borderPattern=BorderPattern.Raised),
            Rectangle(
              extent={{-190,15},{190,-40}},
              lineColor={0,0,0},
              lineThickness=5.0,
              fillColor={245,245,245},
              fillPattern=FillPattern.Solid,
              borderPattern=BorderPattern.Sunken),
            Text(
              extent={{-200,100},{200,60}},
              lineColor={175,175,175},
              textString="%name"),
            Text(
              extent={{-190,40},{20,15}},
              lineColor={95,95,95},
              horizontalAlignment=TextAlignment.Left,
              textString="after"),
            Text(
              extent={{-190,0},{190,-30}},
              lineColor={0,0,0},
              textString="%u"),
            Line(
              points={{44,21},{81,21},{81,39},{91,39},{91,21},{128,21}},
              color={95,95,95},
              smooth=Smooth.None),
            Line(
              points={{45,23},{77,23},{77,39},{126,39}},
              color={255,0,255})}),
        Documentation(info="<html>
<h4>Syntax</h4>

<blockquote><p>
condition = <b>After</b>(u=...).y;
</p></blockquote>

<h4>Description</h4>

<p>
At the first rising edge of Boolean input u, output y[1] = true (and remains true).<br>
At the second rising edge of Boolean input u, output y[2] = true (and remains true).<br>
At the i-th rising edge of Boolean input u, output y[i] = true (and remains true).<br>
If input u = true at initialization, y[1] = true always.
</p>

<h4>Example</h4>

<p>
This block is demonstrated with the following
<a href=\"modelica://Modelica_Requirements.Examples.Elementary.OverlappingTimePeriods.TimeLocators.After\">example</a>: 
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Requirements/Resources/Images/Examples/Elementary/OverlappingTimePeriods/TimeLocators/After1.png\">
</blockquote></p>

<p>
results in
</p>


<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Requirements/Resources/Images/Examples/Elementary/OverlappingTimePeriods/TimeLocators/After2a.png\"></td></tr>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Requirements/Resources/Images/Examples/Elementary/OverlappingTimePeriods/TimeLocators/After2b.png\"></td> </tr>
<tr><td></td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>
</html>"));
    end After;

    block AfterFor
      "Outputs are true, after a rising edge of the input for the defined duration"
      import Modelica_Requirements.LogicalFunctions.forall;
      extends Interfaces.PartialNumberOfPeriods;
      input Boolean u "Boolean input" annotation(Dialog);
      parameter Modelica.SIunits.Time duration(start=1)
        "Duration after rising edge of u";
      Interfaces.BooleanSetOutput y[nPeriods]
        "y[i] = true after i-th rising edge of u for duration seconds"
        annotation (Placement(transformation(extent={{200,-10},{220,10}})));
    protected
      Boolean b[nPeriods](each start=false, each fixed=true);
      Boolean startDuration[nPeriods];
      discrete Modelica.SIunits.Time nextTime[nPeriods];
    initial equation
      nextTime = fill(time-1.0, nPeriods);
      startDuration[1] = u;
      startDuration[2:nPeriods] = fill(false, nPeriods-1);
      y[1]     = u;
      y[2:end] = fill(false,nPeriods-1);

    equation
      for i in 1:nPeriods loop
         b[i] = pre(startDuration[i]) and time >= pre(nextTime[i]);
      end for;

    algorithm
      when u then
        assert(not forall(pre(y)), "Number of detected periods for Continuous Time Locators is above the maximum limit (= " + String(nPeriods) +")");
        for i in 1:nPeriods loop
            if not pre(y[i]) then
               startDuration[i] := true;
               nextTime[i] := time + duration;
               y[i] := true;
               break;
            end if;
        end for;
      end when;

      when b then
         for i in 1:nPeriods loop
            if edge(b[i]) then
               // end of duration reached
               startDuration[i] :=false;
               nextTime[i] :=time - 1.0;
               y[i] :=false;
            end if;
         end for;
      end when;
      annotation (defaultComponentName="afterFor1",
          Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-200,-100},{200,100}},
            grid={1,1}), graphics),
                          Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-200,-100},{200,100}},
            grid={1,1}), graphics={
            Rectangle(
              extent={{-200,100},{200,-100}},
              lineColor={0,0,0},
              lineThickness=5.0,
              fillColor={210,210,210},
              fillPattern=FillPattern.Solid,
              borderPattern=BorderPattern.Raised),
            Rectangle(
              extent={{-190,60},{190,5}},
              lineColor={0,0,0},
              lineThickness=5.0,
              fillColor={245,245,245},
              fillPattern=FillPattern.Solid,
              borderPattern=BorderPattern.Sunken),
            Rectangle(
              extent={{-190,-30},{190,-90}},
              lineColor={0,0,0},
              lineThickness=5.0,
              fillColor={245,245,245},
              fillPattern=FillPattern.Solid,
              borderPattern=BorderPattern.Sunken),
            Text(
              extent={{-200,110},{200,150}},
              lineColor={175,175,175},
              textString="%name"),
            Text(
              extent={{-190,45},{190,15}},
              lineColor={0,0,0},
              textString="%u"),
            Text(
              extent={{-190,90},{20,65}},
              lineColor={95,95,95},
              horizontalAlignment=TextAlignment.Left,
              textString="after"),
            Text(
              extent={{-190,-5},{20,-30}},
              lineColor={95,95,95},
              horizontalAlignment=TextAlignment.Left,
              textString="for"),
            Text(
              extent={{-190,-45},{190,-75}},
              lineColor={0,0,0},
              textString="%duration s")}),
        Documentation(info="<html>
<h4>Syntax</h4>

<blockquote><p>
condition = <b>AfterFor</b>(u=..., duration=...).y;
</p></blockquote>

<h4>Description</h4>

<p>
Output <b>y[1]</b> = true, after a rising edge of the input <b>u</b> for the defined <b>duration</b>.<br>
If another rising edge of the input <b>u</b> occurs before the defined duration of y[1],
output <b>y[2]</b> = true, after this rising edge for the defined <b>duration</b>,
and so on.<br>
In all other cases, y[i] = false.<br>
If u = true at initialization, y[1] = true for the defined duration.
</p>

<h4>Example</h4>

<p>
This block is demonstrated with the following
<a href=\"modelica://Modelica_Requirements.Examples.Elementary.OverlappingTimePeriods.TimeLocators.AfterFor\">example</a>: 
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Requirements/Resources/Images/Examples/Elementary/OverlappingTimePeriods/TimeLocators/AfterFor1.png\">
</blockquote></p>

<p>
results in
</p>


<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Requirements/Resources/Images/Examples/Elementary/OverlappingTimePeriods/TimeLocators/AfterFor2.png\"></td></tr>
<tr><td></td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>
</html>"));
    end AfterFor;
    annotation (Icon(graphics={
          Polygon(
            points={{-26,30},{24,30},{0,-16},{-26,30}},
            lineColor={135,135,135},
            smooth=Smooth.None,
            fillPattern=FillPattern.Solid,
            fillColor={135,135,135}),
          Line(
            points={{0,80},{0,-16}},
            color={0,0,0},
            smooth=Smooth.None),
          Line(
            points={{-86,-72},{0,-72},{0,-26},{88,-26}},
            color={0,0,0},
            smooth=Smooth.None)}), Documentation(info="<html>
<p>
This library contains blocks defining <b>continuous time locators</b>.
All the blocks have a Boolean output vector <b>y</b>. Whenever y[i] = true, 
the desired continuous time location is defined. The outputs y are
usually used as input to one of the 
<a href=\"modelica://Modelica_Requirements.OverlappingTimePeriods.ChecksInFixedWindow\">ChecksInFixedWindow</a>
blocks that check particular properties at the defined time locations.
</p>
</html>"));
  end TimeLocators;

  package ChecksInFixedWindow "Library of check blocks that inspect properties in a fixed time window for overlapping time periods"
      extends Modelica.Icons.Package;
    block During "In every true condition phase, check must be true"
      extends Interfaces.PartialCheck;
      import Modelica_Requirements.LogicalFunctions;
    equation
      property = {LogicalFunctions.during(condition[i],check) for i in 1:nPeriods};

      annotation (defaultComponentName="during1",
            Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-100},
                {200,100}}), graphics={
            Line(
              points={{-168,18},{-168,18},{-168,64},{26,64},{26,22},{26,22}},
              color={255,0,0},
              smooth=Smooth.None),
            Line(
              points={{-192,18},{-168,18}},
              color={0,0,0},
              smooth=Smooth.None),
            Line(
              points={{26,22},{50,22}},
              color={0,0,0},
              smooth=Smooth.None)}), Documentation(info="<html>
<h4>Syntax</h4>

<blockquote><p>
<b>During</b>(condition=..., check=...).y;
</p></blockquote>

<h4>Description</h4>

<p>
In every duration where one of the Boolean inputs <b>condition[i]</b> is true,
the Boolean input <b>check</b> must be true.
During a true condition phase, the instantaneous property  <b>property[i}</b> = Satisfied if check = true,
and Violated if check = false.
During a false condition phase, the instantaneous property property[i] = Undecided.
For more details, see the <a href=\"Modelica_Requirements.OverlappingTimePeriods.ChecksInFixedWindow\">package documentation</a>.
</p>


<p>
Violated, Undecided, and Satisfied are elements of enumeration
<a href=\"modelica://Modelica_Requirements.Types.Property\">Property</a>.
</p>

<h4>Example</h4>

<p>
This block is demonstrated with the following
<a href=\"modelica://Modelica_Requirements.Examples.Elementary.OverlappingTimePeriods.ChecksInFixedWindow.During\">example</a>: 
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Requirements/Resources/Images/Examples/Elementary/OverlappingTimePeriods/ChecksInFixedWindow/During1.png\">
</blockquote></p>

<p>
results in
</p>

<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Requirements/Resources/Images/Examples/Elementary/OverlappingTimePeriods/ChecksInFixedWindow/During2.png\"></td>
    </tr>

<tr><td></td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>
</html>"));
    end During;

    block MinDuration
      "In every true condition phase, check must be true for at least the defined duration"
      import Modelica_Requirements.Types.Property;
      import Mode = Modelica_Requirements.OverlappingTimePeriods.Types.Mode4;

      parameter Modelica.SIunits.Time durationMin(min=0) "Minimum duration in true condition phase";
      extends Interfaces.PartialCheck;
    protected
      Mode mode[nPeriods](each start=Mode.NotInPeriod, each fixed=true) "Actual states of the state machines";
      Real nextTime[nPeriods] "Next time instants where durationMin is reached";
    initial equation
      pre(nextTime) = fill(time - 1.0, nPeriods);
    equation
      for i in 1:nPeriods loop
         mode[i] = if not condition[i] then
                      Mode.NotInPeriod
                   elseif pre(mode[i]) == Mode.NotInPeriod and condition[i] then
                      (if check then Mode.Undecided else Mode.Violated)
                   elseif pre(mode[i]) == Mode.Undecided and time >= pre(nextTime[i]) then
                       Mode.Satisfied
                   elseif pre(mode[i]) == Mode.Undecided and not check then
                       Mode.Violated
                   else pre(mode[i]);

         when mode[i] == Mode.Undecided then
            nextTime[i] = time + durationMin;
         end when;

         property[i] = if mode[i] == Mode.Violated  then Property.Violated elseif
                          mode[i] == Mode.Satisfied then Property.Satisfied else
                                                         Property.Undecided;
      end for;

      annotation (defaultComponentName="minDuration1",
           Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-100},
                {200,100}}), graphics={
            Rectangle(
              extent={{-160,60},{20,10}},
              lineColor={0,0,0},
              lineThickness=5.0,
              fillColor={245,245,245},
              fillPattern=FillPattern.Solid,
              borderPattern=BorderPattern.Sunken),
            Text(
              extent={{-160,45},{20,15}},
              lineColor={0,0,0},
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid,
              textString="%durationMin s"),
            Line(
              points={{-168,18},{-168,18},{-168,64},{26,64},{26,22},{26,22}},
              color={255,0,0},
              smooth=Smooth.None),
            Line(
              points={{-192,18},{-168,18}},
              color={0,0,0},
              smooth=Smooth.None),
            Line(
              points={{26,22},{50,22}},
              color={0,0,0},
              smooth=Smooth.None),
            Text(
              extent={{-160,90},{20,65}},
              lineColor={95,95,95},
              textString=">=")}),    Documentation(info="<html>
<h4>Syntax</h4>

<blockquote><p>
<b>MinDuration</b>(condition=..., check=..., durationMin=...).y;
</p></blockquote>

<h4>Description</h4>

<p>
In every duration where the Boolean inputs <b>condition</b> are true,
the Boolean input <b>check</b> must be true for at least the time span 
defined by parameter <b>durationMin</b>.
Whenever this property is fulfilled for condition[i], then property[i] = Satisfied.
If this property is not fulfilled at the end of a true condition phase,
property[i] = Violated. 
At initialization and when entering a true condition phase,
property[i] = Undecided.
Property[i] keeps its value, until one of the above conditions occur.
The precise definition is given in the following state machine
(when condition[i] = false, the state machine for the i-th check is
in state <b>NotInPeriod</b>):
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Requirements/Resources/Images/OverlappingTimePeriods/StateMachine_MinDuration.png\">
</blockquote></p>

<p>
The property vector is computed from the state machine with
(mode[i] is an element of a protected vector defining the actual state of state machine i):
</p>

<blockquote>
<table border=1 cellspacing=0 cellpadding=2>
<tr><td valign=\"top\"><b>mode[i]</b></td>
    <td valign=\"top\"><b>property[i]</b></td></tr>
<tr><td valign=\"top\">NotInProperty</td>
    <td valign=\"top\" align=\"center\">pre(property[i])</td></tr>
<tr><td valign=\"top\">Violated</td>
    <td valign=\"top\" align=\"center\">Violated</td></tr>
<tr><td valign=\"top\">Undecided</td>
    <td valign=\"top\" align=\"center\">Undecided</td></tr>
<tr><td valign=\"top\">Satisfied</td>
    <td valign=\"top\" align=\"center\">Satisfied</td></tr>
</table>
</blockquote>


<p>
Output y.property is computed with function 
<a href=\"modelica://Modelica_Requirements.LogicalFunctions.PropertiesToProperty\">PropertiesToProperty(..)</a> as
(the function returns Violated, if at least <b>one element</b> of vector property has value Violated;
it returns Satisfied, if no element of property is Violated and at least one element is Satisfied;
otherwise, it returns Undecided):
</p>

<blockquote><pre>
y.property    = PropertiesToProperty(property)
y.cumProperty = PropertyToCumulatedProperty(y.property, pre(y.cumProperty))
</pre></blockquote>

<p>
Violated, Undecided, and Satisfied are elements of enumeration
<a href=\"modelica://Modelica_Requirements.Types.Property\">Property</a>.
</p>

<h4>Example</h4>

<p>
This block is demonstrated with the following
<a href=\"modelica://Modelica_Requirements.Examples.Elementary.OverlappingTimePeriods.ChecksInFixedWindow.MinDuration2\">example</a>: 
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Requirements/Resources/Images/Examples/Elementary/OverlappingTimePeriods/ChecksInFixedWindow/MinDuration3.png\">
</blockquote></p>

<p>
results in
</p>

<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Requirements/Resources/Images/Examples/Elementary/OverlappingTimePeriods/ChecksInFixedWindow/MinDuration4.png\"></td>
    </tr>

<tr><td></td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>
</html>"));
    end MinDuration;
    annotation (Icon(graphics={
          Rectangle(
            extent={{-40,0},{40,-40}},
            lineColor={175,175,175},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Line(
            points={{-88,-40},{-60,-40},{-60,40},{60,40},{60,-40},{90,-40}},
            color={0,0,0},
            smooth=Smooth.None),
          Line(
            points={{-40,-40},{-60,-40},{-60,-40}},
            color={175,175,175},
            smooth=Smooth.None)}), Documentation(info="<html>
<p>
This library provides blocks that check properties in <b>fixed windows</b>
defined by the true values of the Boolean input variables <b>condition[i]</b>.
Whenever one of these variable is true, the check is performed.
</p>

<p>
All blocks of this library have the following interface:
</p>

<ul>
<li> Boolean input vector <b>condition</b>. If condition[i] = true, a check is performed.
     Typically, condition is the output of a time locator from library
     <a href=\"modelica://Modelica_Requirements.OverlappingTimePeriods.TimeLocators\">TimeLocators</a>.</li>

<li> Boolean input <b>check</b> is a scalar Boolean expression that must be true
     according to the property check of the particular block. </li>

<li> The utility element property[i] is the instantaneous property value computed from the input
     condition[i], check, and the property to be checked.

<li> Property output <b>y</b> is an instance of connector
     <a href=\"modelica://Modelica_Requirements.OverlappingTimePeriods.Interfaces.PropertyOutput\">PropertyOutput</a>.
     This connector consists of the element <b>property</b>, the instantaneous value of the property
     that is determined by converting vector property[:] to one value with function
     <a href=\"modelica:Modelica_Requirements.LogicalFunctions.PropertiesToProperty\">PropertiesToProperty</a>.
     Furthermore, element <b>cumProperty</b>, the cumulated value of the property, is present. 
     It is computed according to the 
     following table as a function of the instantaneous property (y.property) and the previous
     value of the cumulated property (pre(y.cumProperty)).
<table border=1 cellspacing=0 cellpadding=2>
  <tr>
    <td rowspan=\"2\" colspan=\"2\"></td>
    <td colspan=\"3\" align=\"center\"><b>pre</b>(<i>y.cumProperty</i>)</td>
  </tr>
  <tr><td><b>Satisfied</b></td>
      <td><b>Untested</b></td>
      <td><b>Violated</b></td></tr>
  <tr><td rowspan=\"3\" valign=\"middle\"><i>y.property</i></td>
      <td><b>Satisfied</b></td>
      <td>Satisfied</td>
      <td>Satisfied</td>
      <td>Violated</td></tr>
  <tr>
      <td><b>Undecided</b></td>
      <td>Satisfied</td>
      <td>Untested</td>
      <td>Violated</td></tr>
  <tr>
      <td><b>Violated</b></td>
      <td>Violated</td>
      <td>Violated</td>
      <td>Violated</td></tr>
</table></li>
</ul>
<
</html>"));
  end ChecksInFixedWindow;

  package LogicalBlocks "Library of logical blocks for overlapping time periods (2-/3-valued logical operators with and without memory)"
    block PropertiesToProperty
      "Convert Property vector to scalar property"
      import Modelica_Requirements.Types.Property;
      import Modelica_Requirements.LogicalFunctions.PropertiesToProperty;
      extends Modelica_Requirements.OverlappingTimePeriods.Interfaces.PartialNumberOfPeriods;
      extends Modelica_Requirements.Interfaces.PartialConversion;
      Modelica_Requirements.OverlappingTimePeriods.Interfaces.PropertyInput u[
        nPeriods] "Property input signals"
        annotation (Placement(transformation(extent={{-90,-20},{-50,20}})));
     Modelica_Requirements.Interfaces.PropertyOutput y
        "Property output signal"
        annotation (Placement(transformation(extent={{50,-10},{70,10}})));
    equation
      y = PropertiesToProperty(u);
      annotation (defaultComponentName="PtoP1",Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}},
            grid={1,1}),     graphics={Text(
              extent={{-48,48},{0,-0}},
              lineColor={0,0,0},
              fillColor={210,210,210},
              fillPattern=FillPattern.Solid,
              fontSize=10,
              textString="Ps"),Text(
              extent={{0,0},{48,-48}},
              lineColor={0,0,0},
              fillColor={210,210,210},
              fillPattern=FillPattern.Solid,
              fontSize=10,
              textString="P")}), Diagram(coordinateSystem(
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
    end PropertiesToProperty;

     extends Modelica.Icons.Package;

    block And "Logical 'and': y[i] = u1[i] and u2[i]"
      extends Interfaces.partialBooleanSI2SO;
    equation
      y = u1 and u2;
      annotation (
        defaultComponentName="and1",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Text(
              extent={{-90,40},{90,-40}},
              lineColor={0,0,0},
              textString="and")}),
        Documentation(info="<html>
</html>"));
    end And;

    block Or "Logical 'or': y[i] = u1[i] or u2[i]"
      extends Interfaces.partialBooleanSI2SO;
    equation
      y = u1 or u2;
      annotation (
        defaultComponentName="or1",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Text(
              extent={{-90,40},{90,-40}},
              lineColor={0,0,0},
              textString="or")}),
        Documentation(info="<html>
</html>"));
    end Or;

    block Xor "Logical 'xor': y = u1[i] xor u2[i]"
      extends Interfaces.partialBooleanSI2SO;
    equation
      y = not ((u1 and u2) or (not u1 and not u2));
      annotation (defaultComponentName="xor1",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-90,40},{90,-40}},
              lineColor={0,0,0},
              textString="xor")}), Documentation(info="<html>
</html>"));
    end Xor;

    block Nor "Logical 'nor': y[i] = not (u1[i] or u2[i])"
      extends Interfaces.partialBooleanSI2SO;
    equation
      y = not (u1 or u2);
      annotation (defaultComponentName="nor1",
                 Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-90,40},{90,-40}},
              lineColor={0,0,0},
              textString="nor")}), Documentation(info="<html>
</html>"));
    end Nor;

    block Nand "Logical 'nand': y[i] = not (u1[i] and u2[i])"
      extends Interfaces.partialBooleanSI2SO;
    equation
      y = not (u1 and u2);
      annotation (defaultComponentName="nand1",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-90,40},{90,-40}},
              lineColor={0,0,0},
              textString="nand")}), Documentation(info="<html>
</html>"));
    end Nand;

    block Not "Logical 'not': y[i] = not u[i]"
      extends Interfaces.partialBooleanSISO;

    equation
      y = not u;
      annotation (
        defaultComponentName="not1",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={Text(
              extent={{-90,40},{90,-40}},
              lineColor={0,0,0},
              textString="not")}),
        Documentation(info="<html>
</html>"));
    end Not;
    annotation (Icon(graphics={
                            Line(
            points={{-86,-20},{-50,-20},{-50,24},{48,24},{48,-20},{88,-20}},
            color={0,0,0})}));
  end LogicalBlocks;

  package Interfaces "Library of interfaces and of partial blocks for overlapping time periods"
    extends Modelica.Icons.InterfacesPackage;
    block PartialNumberOfPeriods "Partial block defining the maximum number of overlapping time periods for the block"
      parameter Integer nPeriods=nMaxPeriods "Maximum number of overlapping time periods"
          annotation(Dialog(tab="Advanced"),HideResult=true);

      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end PartialNumberOfPeriods;

    partial block partialBooleanSI2SO
      "Partial block with 2 input and 1 output Boolean vector connector for overlapping time periods"
      extends PartialNumberOfPeriods;
      extends Icons.PartialBooleanBlock;

      BooleanSetInput u1[nPeriods] "Connector of first Boolean vector input"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
      BooleanSetInput u2[nPeriods] "Connector of second Boolean vector input"
        annotation (Placement(transformation(extent={{-140,-100},{-100,-60}})));
      BooleanSetOutput y[nPeriods] "Connector of Boolean vector output"
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));

      annotation (Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}})),   Documentation(info="<html>
<p>
Block has two Boolean vector inputs and one Boolean vector output signal.
</p>
</html>"));

    end partialBooleanSI2SO;

    partial block partialBooleanSISO
      "Partial block with 1 input and 1 output Boolean vector connector for overlapping time periods"
      extends PartialNumberOfPeriods;
      extends Icons.PartialBooleanBlock;
      BooleanSetInput u[nPeriods] "Connector of Boolean input signal"
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
      BooleanSetOutput y[nPeriods] "Connector of Boolean output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));

      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}})),                   Documentation(info="<html>
<p>
Block has one Boolean vector input and one Boolean vector output signal.
</p>
</html>"));

    end partialBooleanSISO;

    partial block PartialCheck "Interfaces and icon for a check block with a Boolean vector input for overlapping time periods"
      import Modelica_Requirements.Types.Property;
      import Modelica_Requirements.Types.CumulatedProperty;
      import Modelica_Requirements.LogicalFunctions.PropertiesToProperty;
      import Modelica_Requirements.LogicalFunctions.PropertyToCumulatedProperty;

      extends PartialNumberOfPeriods;
      input Boolean check(start = false) "Boolean to check"  annotation(Dialog);
      BooleanSetInput condition[nPeriods] "Boolean input condition signals" annotation (Placement(transformation(extent={{-240,-19},{-200,21}})));
      output Property property[nPeriods] "The instantaneous properties";
      PropertyOutput y "Property output signals" annotation (Placement(transformation(extent={{200,-10},{220,10}})));
    initial equation
      pre(y.cumProperty) = CumulatedProperty.Untested;
    equation
      y.property    = PropertiesToProperty(property);
      y.cumProperty = PropertyToCumulatedProperty(y.property, pre(y.cumProperty));

      annotation (Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-200,-100},{200,100}},
            grid={1,1}), graphics),
                          Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-200,-100},{200,100}},
            grid={1,1}), graphics={
            Rectangle(
              extent={{-200,100},{200,-100}},
              lineColor={0,0,0},
              lineThickness=5.0,
              fillColor={210,210,210},
              fillPattern=FillPattern.Solid,
              borderPattern=BorderPattern.Raised),
            Rectangle(
              extent={{-190,0},{190,-90}},
              lineColor={0,0,0},
              lineThickness=5.0,
              fillColor={245,245,245},
              fillPattern=FillPattern.Solid,
              borderPattern=BorderPattern.Sunken),
            Text(
              extent={{-200,110},{200,150}},
              lineColor={175,175,175},
              textString="%name"),
            Text(
              extent={{50,30},{180,0}},
              lineColor={95,95,95},
              horizontalAlignment=TextAlignment.Right,
              textString="check"),
            Text(
              extent={{-190,-30},{190,-60}},
              lineColor={0,0,0},
              textString="%check")}));
    end PartialCheck;

    connector BooleanSetInput = input Boolean "'input Boolean' as connector for overlapping time periods"
      annotation (
      defaultComponentName="u",
      Icon(graphics={Polygon(
            points={{-100,100},{100,0},{-100,-100},{-100,100}},
            lineColor={255,0,255},
            fillColor={255,0,255},
            fillPattern=FillPattern.Solid), Polygon(
            points={{-60,140},{140,40},{100,0},{-100,100},{-60,140}},
            lineColor={255,0,255},
            fillColor={255,170,255},
            fillPattern=FillPattern.Solid)}, coordinateSystem(
          extent={{-100,-100},{100,100}},
          preserveAspectRatio=true,
          initialScale=0.2,
          grid={1,1})),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          initialScale=0.2,
          extent={{-100,-100},{100,100}},
          grid={1,1}),                     graphics={
          Polygon(
            points={{10,60},{110,10},{100,0},{0,50},{10,60}},
            lineColor={255,0,255},
            fillColor={255,170,255},
            fillPattern=FillPattern.Solid),          Polygon(
            points={{0,50},{100,0},{0,-50},{0,50}},
            lineColor={255,0,255},
            fillColor={255,0,255},
            fillPattern=FillPattern.Solid), Text(
            extent={{-10,103},{-10,78}},
            lineColor={255,0,255},
            textString="%name")}),
      Documentation(info="<html>
<p>
Connector with one input signal of type Boolean (used as vector connector for overlapping time periods).
</p>
</html>"));
    connector BooleanSetOutput = output Boolean "'output Boolean' as connector for overlapping time periods"
      annotation (
      defaultComponentName="y",
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={Polygon(
            points={{-60,140},{140,40},{100,0},{-100,100},{-60,140}},
            lineColor={255,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),          Polygon(
            points={{-100,100},{100,0},{-100,-100},{-100,100}},
            lineColor={255,0,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={Polygon(
            points={{-100,50},{0,0},{-100,-50},{-100,50}},
            lineColor={255,0,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid), Text(
            extent={{30,116},{30,66}},
            lineColor={255,0,255},
            textString="%name"),
          Polygon(
            points={{-90,60},{10,10},{0,0},{-100,50},{-90,60}},
            lineColor={255,0,255},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid)}),
      Documentation(info="<html>
<p>
Connector with one output signal of type Boolean (used as vector connector for overlapping time periods).
</p>
</html>"));
    connector PropertyInput
      "Instantaneous and accumulated property as input to a blcok"
        input Modelica_Requirements.Types.Property property "Instantaneous property";
        input Modelica_Requirements.Types.CumulatedProperty cumProperty "Cumulated property";

      annotation (
      defaultComponentName="u",
      Icon(graphics={Polygon(
            points={{-100,100},{100,0},{-100,-100},{-100,100}},
            lineColor={255,0,128},
            fillColor={255,0,128},
            fillPattern=FillPattern.Solid)}, coordinateSystem(
          extent={{-100,-100},{100,100}},
          preserveAspectRatio=true,
          initialScale=0.2,
          grid={1,1})),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          initialScale=0.2,
          extent={{-100,-100},{100,100}},
          grid={1,1}),                     graphics={Polygon(
            points={{0,50},{100,0},{0,-50},{0,50}},
            lineColor={255,0,128},
            fillColor={255,0,128},
            fillPattern=FillPattern.Solid), Text(
            extent={{-10,85},{-10,60}},
            textString="%name",
            pattern=LinePattern.None,
            lineColor={255,0,128})}),
      Documentation(info="<html>
<p>
</p>
</html>"));
    end PropertyInput;

    connector PropertyOutput
      "Instantaneous and cumulated property as output of a block"
        output Modelica_Requirements.Types.Property property "Instantaneous property";
        output Modelica_Requirements.Types.CumulatedProperty cumProperty "Cumulated property";

      annotation (
      defaultComponentName="y",
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={Polygon(
            points={{-100,100},{100,0},{-100,-100},{-100,100}},
            lineColor={255,0,128},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={Polygon(
            points={{-100,50},{0,0},{-100,-50},{-100,50}},
            lineColor={255,0,128},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid), Text(
            extent={{30,110},{30,60}},
            lineColor={255,0,128},
            textString="%name")}),
      Documentation(info="<html>
<p>
</p>
</html>"));
    end PropertyOutput;
  end Interfaces;

  package Icons "Library of icons (for overlapping time periods)"
    extends Modelica.Icons.IconsPackage;
    partial block PartialBooleanBlock
      "Basic graphical layout of logical block"

      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              fillColor={210,210,210},
              lineThickness=5.0,
              fillPattern=FillPattern.Solid,
              borderPattern=BorderPattern.Raised), Text(
              extent={{-150,150},{150,110}},
              lineColor={175,175,175},
              textString="%name")}),                         Documentation(info="<html>
<p>
Block that has only the basic icon for an input/output,
Boolean block (no declarations, no equations).
</p>
</html>"));
    end PartialBooleanBlock;
  end Icons;

  package Types "Library of type definitions (for overlapping time periods)"
    extends Modelica.Icons.TypesPackage;
    type Mode4 = enumeration(
        NotInPeriod,
        Satisfied,
        Undecided,
        Violated) "States of a state machine";

  end Types;
  annotation (Icon(graphics={
        Line(
          points={{-86,20},{-42,20},{-42,64},{26,64},{26,20},{86,20}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-88,-62},{-14,-62},{-14,-18},{54,-18},{54,-62},{84,-62}},
          color={0,0,0},
          smooth=Smooth.None)}), Documentation(info="<html>
<p>
This library provides blocks to check properties in <b>overlapping time periods</b>.
This means that a time locator defines a set of time periods that need to be checked and these
time periods might be overlapping. For every, potentially overlapping, time period the defined
checks are performed.
</p>

<p>
See the typical
<a href=\"modelica://Modelica_Requirements.Examples.Elementary.OverlappingTimePeriods.ChecksInFixedWindow.MinDuration2\">example</a>: 
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Requirements/Resources/Images/Examples/Elementary/OverlappingTimePeriods/ChecksInFixedWindow/MinDuration3.png\">
</blockquote></p>

<p>
that results in
</p>

<table border=0 cellspacing=0 cellpadding=2>
<tr><td width=\"50\"></td>
    <td valign=\"bottom\"><img src=\"modelica://Modelica_Requirements/Resources/Images/Examples/Elementary/OverlappingTimePeriods/ChecksInFixedWindow/MinDuration4.png\"></td>
    </tr>

<tr><td></td>
    <td align=\"center\">simulation result</td>
   </tr>
</table>
</html>"));
end OverlappingTimePeriods;
