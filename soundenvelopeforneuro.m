function envelope_resample (block)
% Level-2 MATLAB file S-Function for times two demo.
%   Copyright 1990-2009 The MathWorks, Inc.
%   $Revision: 1.1.6.2 $

setup(block);
    function setup(block)
                %%
        block.RegBlockMethod('SetInputPortDimensions', @SetInpPortDims);

        %% Register number of input and output ports
        block.NumInputPorts  = 1;
        block.NumOutputPorts = 1;
        
        %% Setup functional port properties to dynamically
%         block.InputPort(1).Dimensions = 32000;
        %block.OutputPort(1).Dimensions = 128;

        %%
        block.SetPreCompPortInfoToDefaults;
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
        block.RegBlockMethod('Outputs',@Output);

    end

    function Start(block)
        disp('hi')
    end
%%
    function SetInpPortDims(block,idx,dim)
        block.InputPort(1).Dimensions = [4 1];
        block.OutputPort(1).Dimensions = [1 1];
    end

    function Output(block)
        x = block.InputPort(1).Data;
        x_resample = resample(abs(x'),64,16000);

        block.OutputPort(1).Data = x_resample';
    end
end