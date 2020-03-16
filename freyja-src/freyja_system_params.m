function FreyjaParams = freyja_system_params()
% FREYJASYSTEMPARAMS Generate useful quantities for the freyja multicopter
% system simulator. The returned structure can be used for the various
% elements' dialog boxes. Check example.
%   -- aj // Nimbus.

  % rope parameters
  string_stiffness = 0.005;
  string_damping = 0.001;
  rope_half_length = 0.050;                 % m
  rope_cyl_rad = 0.005;                     % read only, m
  rope_cyl_hgt = 2*rope_half_length;        % m
  rope_density = 0.05;                      % g/cm^3
  n_rope_links = 40;                        % directly attached to UAS
  total_rope_mass = n_rope_links*...
                    (pi * (rope_cyl_rad^2) * rope_cyl_hgt)*...
                    (rope_density*1000);

  drag_on = 1;                              % hee hee, dragon


  % System matrices for full control
  A = [ 0 0 0 1 0 0 0; ...
        0 0 0 0 1 0 0; ...
        0 0 0 0 0 1 0; ...
        zeros(4,7)  ];
  B = [ zeros(3,4); ...
        eye(4) ];
  % LQR params
  Q = [ 10     0     0     0     0     0     0
        0     10     0     0     0     0     0
        0     0     10     0     0     0     0
        0     0     0     1    0     0     0
        0     0     0     0     1    0     0
        0     0     0     0     0     10     0
        0     0     0     0     0      0     1 ]*1;
  R = [ 1     0     0     0
        0     1     0     0
        0     0     1     0
        0     0     0     1 ]*3;
  lqr_K_matrix = lqr( A, B, Q, R );

  % Redefine system matrices for vel control only
  A = zeros(4,4);
  B = eye(4);
  % LQR params
  Q = [ 10     0     0     0; ...
        0     10     0     0; ...
        0     0     10     0; ...
        0     0     0      1 ];
  R = [ 2     0     0     0
        0     2     0     0
        0     0     1     0
        0     0     0     1 ];
  lqr_K_matrix_vel = [zeros(4,3), lqr( A, B, Q, R )];


  % temporary fix, has been here for the last 2.5 years
  RYaw = [  cos(0) -sin(0)  0; ...
            sin(0)  cos(0)  0;
            0       0       1 ];

  FreyjaParams = struct( 'lqr_K_matrix', lqr_K_matrix, ...
                         'lqr_K_matrix_vel', lqr_K_matrix_vel, ...
                         'n_rope_links', n_rope_links, ...
                         'total_rope_mass', total_rope_mass, ...
                         'cable_stiffness', string_stiffness, ...
                         'cable_damping', string_damping, ...
                         'cable_half_length', rope_half_length, ...
                         'cable_density', rope_density, ...
                         'cable_radius', rope_cyl_rad );
end