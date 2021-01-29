# data file format (see plugins/readers)
FORMAT='su'

WORKFLOW='inversion'    # inversion, migration, modeling
SOLVER='elastic'      # specfem2d, specfem3d
SYSTEM='multithreaded'       # serial, pbs, slurm
OPTIMIZE='LBFGS'     # base
PREPROCESS='base'  # base
POSTPROCESS='base'   # base

MISFIT='Waveform'
MATERIALS='kappa_mu'
DENSITY='Constant'


# WORKFLOW
BEGIN=1                 # first iteration
END=50                  # last iteration
NREC=410                # number of receivers
NSRC=40               # number of sources
SAVEGRADIENT=1          # save gradient how often
SAVEMODEL=1				# default=1
SAVEKERNELS=0			# default=0
SAVETRACES=0			# default=0
SAVERESIDUAL=0			# default=0

# PREPROCESSING
READER='su_specfem2d'   # data file format
CHANNELS='z'           # data channels
NORMALIZE='NormalizeEventsL2'             # normalize
MUTE='MuteBodyWaves'                  # mute direct arrival
MUTECONST=0.	         # mute constant
MUTESLOPE=0.	         # mute slope
MUTE_BODY_WAVES_SLOPE1=0.00044444
MUTE_BODY_WAVES_CONST1=0.01
MUTE_BODY_WAVES_SLOPE2=0.00070588
MUTE_BODY_WAVES_CONST2=0.01

# OPTIMIZATION
STEPMAX=10              # maximum trial steps
STEPTHRESH=0.1          # step length safeguard

# POSTPROCESSING
SMOOTH=10.               # smoothing radius
SCALE=1.                # scaling factor

# SOLVER
NT=6000                 # number of time steps
DT=8.0e-4               # time step
F0=10.0                  # dominant frequency

# SYSTEM
NTASK=NSRC                 # number of tasks
NGPU=1
NPROC=1                 # processors per task
TASKTIME=10             # walltime for simulation
WALLTIME=30				# walltime for entire simulation
NODESIZE=1              # number of cores per node
NPROCMAX=10
