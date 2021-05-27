function TREF = basic_trajectory_provider( func_input )
%BASIC_TRAJECTORY_PROVIDER Example circular trajectory for multicopter.
%
% Usage notes:
%     > Simulink allows only one input (a Matlab vector, prefer 1D)
%     > Use vector-concatenate block in Simulink to have this input contain
%       more elements, and then parse it here -- perhaps like so:
%         tnow        = func_input(1);
%         my_state    = func_input(2:8);      % [pn;pe;pd;vn;ve;vd;yaw]
%         other_data  = func_input(9:10);
%         n_cookies   = func_input(11);
%
%     > Output must always be a 7-vector reference: [pn;pe;pd;vn;ve;vd;yaw]
%     > Use `assert(length(TREF))==7` if using codegen.
%
%  ~ aj / Nimbus Lab.

tnow = func_input(1);

TREF = [ 2*sin(tnow); ...
           2*cos(tnow); ...
           -1.5;          ...
           2*cos(tnow); ...
           -2*sin(tnow); ...
           0;           ...
           0 ];
end

