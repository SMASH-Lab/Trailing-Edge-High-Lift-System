within Modelica_Requirements;
package Francesco_Aiello "Raccolta di modelli di test"
  model Test_1
    "Testo il blocco max rising per introdurmi alla compilazione in Dymola"
    Modelica.Blocks.Sources.BooleanTable condition(table = {1, 2, 3, 3.5, 4}, startValue = false) annotation(Placement(transformation(extent={{-70,60},
              {-50,80}})));
    ChecksInFixedWindow.MaxRising                       maxRising(                 nRisingMax = 4, check=
          engineStart.y)                                                                           annotation(Placement(transformation(extent={{-30,60},
              {10,80}})));
    Modelica.Blocks.Sources.BooleanTable engineStart(startValue=true, table={
          0.2,0.3,0.4,1.1,1.2,1.3,1.4,2.2,2.5,3.1,3.15,3.2,3.25,3.3,3.35,3.4,
          3.45})
      annotation (Placement(transformation(extent={{-70,28},{-50,48}})));
  equation
    connect(condition.y,maxRising. condition) annotation(Line(points={{-49,70},
            {-40,70},{-40,70.1},{-32,70.1}},                                                                             color = {255, 0, 255}, smooth = Smooth.None));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Test_1;

  model Test_2
    "Testo un ulteriore blocco per capire se questa versione free di Dymola consente di vedere l'output di qualcuno dei blocchi della libreria"
    ChecksInFixedWindow.WithinDomain withinDomain1
      annotation (Placement(transformation(extent={{2,14},{42,54}})));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(table=[0,0.26,1;
          0.023,0.262864,1.02; 0.046,0.31059,1.02; 0.069,0.328082,1.03; 0.092,
          0.339319,1.05; 0.115,0.366828,1.07; 0.138,0.394388,1.1; 0.161,
          0.413196,1.11; 0.184,0.434519,1.12; 0.207,0.45963,1.13; 0.23,0.473459,
          1.14; 0.253,0.497347,1.15; 0.276,0.518703,1.16; 0.299,0.542597,1.17;
          0.322,0.556408,1.18; 0.345,0.574017,1.19; 0.368,0.596673,1.2; 0.391,
          0.621856,1.21; 0.414,0.647041,1.22; 0.437,0.673492,1.23; 0.46,
          0.698669,1.24; 0.483,0.723857,1.25; 0.506,0.749043,1.26; 0.529,
          0.772973,1.27; 0.552,0.796897,1.25; 0.575,0.827112,1.22; 0.598,
          0.859848,1.19; 0.621,0.883775,1.18; 0.644,0.901416,1.19; 0.667,
          1.08581,1.18; 0.69,1.09965,1.17; 0.713,1.11854,1.16; 0.736,1.15004,
          1.15; 0.759,1.19289,1.14; 0.782,1.24708,1.13; 0.805,1.31012,1.12;
          0.828,1.38575,1.11; 0.851,1.44375,1.1; 0.874,1.48661,1.09; 0.897,
          1.53575,1.08; 0.92,1.56474,1.07; 0.943,1.6114,1.06; 0.966,1.65676,
          1.05; 0.989,1.70086,1.04; 1.012,1.74873,1.03; 1.035,1.79787,1.02;
          1.058,1.79731,1.01])
      annotation (Placement(transformation(extent={{-72,10},{-52,30}})));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Test_2;
end Francesco_Aiello;
