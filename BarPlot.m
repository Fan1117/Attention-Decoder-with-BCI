                                                                             function BarPlot (block)
% Level-2 MATLAB file S-Function for times two demo.
%   Copyright 1990-2009 The MathWorks, Inc.
%   $Revision: 1.1.6.2 $ 

setup(block);
function setup(block)  
  %% Register number of input and output ports
  block.NumInputPorts  = 1;
  block.NumOutputPorts = 1;

  %% Setup functional port properties to dynamically
  %% inherited.
  block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;
  block.InputPort(1).DirectFeedthrough = true;  
  %% Set block sample time to inherited
  block.SampleTimes = [-1 0];
  
  %% Set the block simStateCompliance to default (i.e., same as a built-in block)
  block.SimStateCompliance = 'DefaultSimState';
 
  %% Register methods
  block.RegBlockMethod('Start',@Start);
  block.RegBlockMethod('Outputs',                 @Output);  
end

function Start(block)
disp('hi')
global CurrentTime
global total
total = 0
CurrentTime = 0;
end

function Output(block)
% get the input of s-function 
InData = block.InputPort(1).Data;
global CurrentTime
global total
figure(1)
if get(block, 'CurrentTime') - CurrentTime > 0.1
    CurrentTime = get(block, 'CurrentTime');
    if InData > 0 & total < 5
        total = total + 0.5;
        trigger = 0;
    else if InData < 0 & total >-5
            total = total -0.5;
            trigger = 1;
        end
    end
    if total>0
        bar(total,'b');
    else
        bar(total,'r');
    end
    axis([0 2 -5 5]);
    block.OutputPort(1).Data(1) = total;
end

end
end