within ;
package Modelica_Requirements "Modelica_Requirements (Version 0.10) - Defining and checking formal requirements based on temporal logic"
  extends Modelica.Icons.Package;


package UsersGuide "User's Guide"
  extends Modelica.Icons.Information;

package ReleaseNotes "Release notes"
  extends Modelica.Icons.ReleaseNotes;

  class Version_0_3_2 "Version 0.3.2 (Dez. 8, 2014)"
  extends Modelica.Icons.ReleaseNotes;

    annotation (Documentation(info="<html>

<ul>
<li> Added functions first, last, oneTrue to package LogicalFunctions.</li>
<li> Added function forall3 and blocks WhenFalling, WhenChanging to package Verify.</li>
<li> Added appropriate examples for all functions and blocks to Examples.Textual.Elementary.LogicalFunctions/.Verify.</li>
</ul>
</html>"));
  end Version_0_3_2;

  class Version_0_3_1 "Version 0.3.1 (Sept. 15, 2014)"
  extends Modelica.Icons.ReleaseNotes;

    annotation (Documentation(info="<html>

<ul>
<li> Fixed the issue that simulation runs resulted in an accumulated log file.</li>
<li> Moved the type definitions (type Property and Event) from package Verify to
     the new package Types (as usual in Modelica libraries).</li>
<li> Documentation slighty improved and a few minor documentation errors corrected.</li>
<li> Added icons for packages LogicalFunctions, Temporal and Verify </li>
</ul>
</html>"));
  end Version_0_3_1;

  class Version_0_3 "Version 0.3 (July 23, 2014)"
  extends Modelica.Icons.ReleaseNotes;

    annotation (Documentation(info="<html>

<p>
The previous library \"Properties\" was split in to library \"Modelica_Requirements\" for
two-valued logic and in library \"Properties3\" for
three-valued logic. The Modelica_Requirements library was cleaned-up
(blocks DuringAny and DuringAccumulated have been rewritten,
and the documentation has been improved). Furthermore, Requirements was
changed to a block and a summary of violated and not tested requirements
is now printed after the end of a simulation. Finally, the library was
adapted so that the blocks are called as functions and more general
array comprehensions are used (all supported by a Dymola prototype).
Finally, all errors in the MPS part of the benchmark have been fixed and
the example should now produce correct results.
</p>

<p>
This work was carried out by Martin Otter.
<p>

</html>"));
  end Version_0_3;

class Version_0_1 "Version 0.1 (May 26, 2014)"
  extends Modelica.Icons.ReleaseNotes;

annotation (Documentation(info="<html>

<p>
First version of library. The basis version of the library is for two-valued logic
(Booleans). In a subpackage, first experiments with a three-valued logic have been
performed. The functions \"card\", \"forall\" and \"exists\" are based on a design
by Hilding Elmqvist. The library has been implemented by Martin Otter.
<p>

</html>"));
end Version_0_1;
 annotation (Documentation(info="<html>

<p>
This section summarizes the changes that have been performed
on package Modelica_Requirements.
</p>
</html>"));
end ReleaseNotes;

class Contact "Contact"
  extends Modelica.Icons.Contact;

 annotation (Documentation(info="<html>
<dl>
<dt><b>Main Author</b></dt>
<dd>Martin Otter<br>
    German Aerospace Center (DLR)<br>
    Robotics and Mechatronics Center<br>
    Institute of System Dynamics and Control<br>
    Postfach 1116<br>
    D-82230 Wessling<br>
    Germany<br>
    email: <a href=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</A><br></dd>
</dl>
<p><b>Acknowledgements:</b></p>
<ul>
<li> The library is heavily based on Thuys work within the MODRIO
     project and especially Thuys FORM_L language and his backup-power-supply
     benchmark.</li>
<li> The functions \"card\", \"forall\" and \"exists\" are based on a design
     by Hilding Elmqvist from Dassault Syst&egrave;mes Lund.</li>
<li> The functions \"first\", \"last\", \"oneTrue\" 
     and the blocks \"WhenFalling\", \"WhenChanging\" are from Andrea Tunis (UNICAL).</li>
<li> Wladimir Schamai suggested to use a mix of 2- and 3-valued logic.</li>
</ul>
</html>"));

end Contact;

annotation (DocumentationClass=true, Documentation(info="<html>
<p>
Library <b>Modelica_Requirements</b> is a Modelica package
using temporal logic to formally define requirements
and automatically test these requirements when a model
is simulated.
</p>
</html>"));
end UsersGuide;


  annotation (preferredView="info",
  uses(Modelica(version="3.2.2"), Modelica_Synchronous(version="0.92")),
version="0.10",
versionBuild=0,
versionDate="2015-11-09",
dateModified = "2015-11-09 08:44:41Z",
revisionId="$Id:: package.mo 1972 2016-01-26 16:21:37Z #$",
Documentation(info="<html>
<p>
Library <b>Modelica_Requirements</b> is a Modelica package
using temporal logic to formally define and check requirements.
It is based on work by EDF (especially Thuy: FORM_L language + Backup Power Supply benchmark).
The package demonstrates that formal requirement definitions can be implemented in Modelica.
Furthermore, the purpose of this package is to identify Modelica extensions to
make the definition of requirements nicer and more convenient to use.
</p>

<p>
In order to define properties and requirements mostly a 2-valued logic is used.
There are a some functions and blocks based on 3-valued logic using type 
<a href=\"modelica://Modelica_Requirements.Types.Property\">Property</a>, especially
block <a href=\"modelica://Modelica_Requirements.Verify.Requirement\">Requirement</a>.
Furthermore, there are cast-operators to map 2-valued to 3-valued logic
(<a href=\"modelica://Modelica_Requirements.LogicalFunctions.toProperty\">toProperty</a>,
<a href=\"modelica://Modelica_Requirements.LogicalFunctions.during\">during</a>).
A detailled discussion of the pros and cons of 2- and 3-valued logics is
present in ticket <a href=\"https://trac.modrio.org/MODRIO/ticket/1\">#1</a> on the
MODRIO trac.
</p>

<p>
In this package the standard convention is used that names of
memory-less operators (implemented as Modelica functions)
start with lower-case letters and names of operators
with memory (implemented as Modelica blocks) start with
upper-case letters.
</p>

<p>
This package uses the following Modelica extensions (supported in a prototype of
Dymola; if you would like to get this prototype within the MODRIO project, please
contact <a href=\"mailto:Dan.HENRIKSSON@3ds.com\">Dan.HENRIKSSON@3ds.com</a>):
</p>

<ul>
<li> Support of \"b1 := forall({exists({p.IsActive for p in s.P}) for s in S});\"
     (as clarified in Modelica 3.3 revision 1).</li>

<li> Calling blocks as functions, as proposed in
     <a href=\"https://svn.modelica.org/projects/MCP-Ideas/MAinternal/MCPI-0012_CallingBlocksAsLogicalFunctions/MCPI-0012_CallingBlocksAsLogicalFunctions.docx\">MCPI 0012</a>.
</li>
</ul>

<p>
If you plan a publication that is based on this library, the
<a href=\"modelica://Modelica_Requirements.UsersGuide.Contact\">author(s)</a>
of this library should be included as authors of the publication, or
if this library makes only a short part of the paper, the authors should be included
at least in an acknowledgment section.
</p>

<p>
A contribution to this library is welcome. If you contribute, you agree that your
contribution is published under the Modelica License 2 license (see below).
You will then also be listed under \"Authors\".
</p>


<p>
<i>This Modelica package is <u>free</u> software and
the use is completely at <u>your own risk</u>;
it can be redistributed and/or modified under the terms of the
Modelica license 2, see the license conditions (including the
disclaimer of warranty) at
<a href=\"https://www.Modelica.org/licenses/ModelicaLicense2\">
https://www.Modelica.org/licenses/ModelicaLicense2</a>.</i>
</p>


<p>
<b>Copyright &copy; 2014-2015, DLR Institute of System Dynamics and Control, Dassault Aviation, 
   Linköping University and UNICAL</b>
</p>
</html>"),
  Icon(graphics));
end Modelica_Requirements;
