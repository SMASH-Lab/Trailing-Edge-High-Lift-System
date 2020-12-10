package Aircraft_OM

  class test_1
  Modelica.Blocks.Sources.BooleanTable condition annotation(Placement(visible = true, transformation(origin = {-22, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanTable check annotation(Placement(visible = true, transformation(origin = {-22, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica_Requirements.ChecksInFixedWindow.MaxRising maxRising1(nRisingMax = 4) annotation(Placement(visible = true, transformation(origin = {56, 34}, extent = {{-20, -10}, {20, 10}}, rotation = 0)));
    equation
    connect(condition.y, maxRising1.condition) annotation(Line(points = {{-11, 50}, {-4.5, 50}, {-4.5, 34}, {34, 34}}, color = {255, 0, 255}));
    annotation(uses(Modelica(version = "3.2.1"), Modelica_Requirements(version = "0.10")));
  end test_1;

  model test_maxRising
  Modelica.Blocks.Sources.BooleanTable condition(startValue = false, table = {1, 2, 3, 3.5, 4})  annotation(Placement(visible = true, transformation(origin = {-62, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanTable signal(startValue = true, table = {0.2, 0.3, 0.4, 1.1, 1.2, 1.3, 1.4, 2.2, 2.5, 3.1, 3.15, 3.2, 3.25, 3.3, 3.35, 3.4, 3.45})  annotation(Placement(visible = true, transformation(origin = {-62, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica_Requirements.ChecksInFixedWindow.MaxRising maxRising1(check = signal.y, nRisingMax = 3)  annotation(Placement(visible = true, transformation(origin = {-4, 48}, extent = {{-20, -10}, {20, 10}}, rotation = 0)));
    equation
    connect(condition.y, maxRising1.condition) annotation(Line(points = {{-50, 48}, {-26, 48}}, color = {255, 0, 255}));
    annotation(uses(Modelica_Requirements(version = "0.10"), Modelica(version = "3.2.1")));
  end test_maxRising;

  model req_curved_track
  Modelica_Requirements.LogicalBlocks.WithinBand condition(u_max = 4, u_min = 2)  annotation(Placement(visible = true, transformation(origin = {-28, 44}, extent = {{-20, -10}, {20, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable FowlerMotion(table = [0, 0; 1, 1; 2, 2; 3, 3; 4, 4; 5, 5; 6, 6; 7, 7; 8, 8; 9, 9; 10, 10])  annotation(Placement(visible = true, transformation(origin = {-74, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica_Requirements.ChecksInFixedWindow.During during1(check = check.y)  annotation(Placement(visible = true, transformation(origin = {52, 16}, extent = {{-20, -10}, {20, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable DeflectionAngle(table = [0, 0; 1, 1; 2, 2; 3, 3; 4, 4; 5, 5; 6, 6; 7, 7; 8, 8; 9, 9; 10, 10])  annotation(Placement(visible = true, transformation(origin = {-74, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica_Requirements.LogicalBlocks.WithinBand check(u_max = 3, u_min = 1)  annotation(Placement(visible = true, transformation(origin = {-18, 0}, extent = {{-20, -10}, {20, 10}}, rotation = 0)));
    equation
    connect(FowlerMotion.y, check.u) annotation(Line(points = {{-63, 0}, {-40, 0}}, color = {0, 0, 127}));
    connect(condition.y, during1.condition) annotation(Line(points = {{-7, 44}, {15, 44}, {15, 16}, {30, 16}}, color = {255, 0, 255}));
    connect(DeflectionAngle.y, condition.u) annotation(Line(points = {{-62, 44}, {-50, 44}}, color = {0, 0, 127}));
    annotation(uses(Modelica(version = "3.2.1"), Modelica_Requirements(version = "0.10")));
  end req_curved_track;

  model test_input_csv
  Modelica.Blocks.Sources.TimeTable timeTable1 annotation(Placement(visible = true, transformation(origin = {-60, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D1 annotation(Placement(visible = true, transformation(origin = {-12, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1 annotation(Placement(visible = true, transformation(origin = {-74, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica_Requirements.Sources.PropertyTable propertyTable1 annotation(Placement(visible = true, transformation(origin = {-46, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    annotation(uses(Modelica(version = "3.2.1"), Modelica_Requirements(version = "0.10")));
  end test_input_csv;

  model dummy_fmu
  
    parameter Real R = 8.3144621;
    parameter Real V0 = 0.0008;
    parameter Real T = 293.15;
    parameter Real p0 = 3 * 101325.0;
    parameter Real D0 = 0.08;
    parameter Real k1 = 200;
    parameter Real k2 = 5;
    Real A0;
    Real V;
    Real nu;
    Real Av;
    Real p;
    Real D;
    Modelica.Blocks.Interfaces.RealInput xFL ;
    Modelica.Blocks.Interfaces.RealOutput FFL;
  equation
    A0 = 3.14 * (D0 / 2) ^ 2;
    D = tanh(k1 * xFL) / k2 * D0 + D0;
    Av = 3.14 * (D / 2) ^ 2;
    p = (nu * R * T) / V;
    nu = (p0 * V0) / (R * T);
    V = V0 - (Av * xFL) / 2;
    FFL = p * Av;
  
  
  end dummy_fmu;
end Aircraft_OM;