function BarPlot (block)
% Level-2 MATLAB file S-Function for times two demo.
%   Copyright 1990-2009 The MathWorks, Inc.
%   $Revision: 1.1.6.2 $

setup(block);
    function setup(block)
        %% Register number of input and output ports
        block.NumInputPorts  = 2;
        block.NumOutputPorts = 1;
        
        %% Setup functional port properties to dynamically
        %% inherited.
        block.SetPreCompInpPortInfoToDynamic;
        block.SetPreCompOutPortInfoToDynamic;
        block.InputPort(1).DirectFeedthrough = true;
        block.InputPort(2).DirectFeedthrough = true;
        %% Set block sample time to inherited
        block.SampleTimes = [-1 0];
        
        %% Set the block simStateCompliance to default (i.e., same as a built-in block)
        block.SimStateCompliance = 'DefaultSimState';
        
        %% Register methods
        block.RegBlockMethod('Start',@Start);
        block.RegBlockMethod('Outputs',@Output);
    end

    function Start(block)
        disp('hi')
    end

    function Output(block)
        x = double(block.InputPort(1).Data);
        y = double(block.InputPort(2).Data);
        if length(x)~=length(y)
            error('dimension mismatch');
            return;
        end
        numerator = sum(x.*y)-(sum(x)*sum(y))/length(x);
        denominator = sqrt((sum(x.^2)-sum(x)^2/length(x))*(sum(y.^2)-sum(y)^2/length(x)));
        if denominator == 0
            coeff = 0;
        else
            coeff = numerator/denominator;
        end
        block.OutputPort(1).Data(1) = coeff;
    end
end