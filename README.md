# Preamble

This GitHub repository was created when I was [a postdoc at UC Santa Barbara](https://labs.me.ucsb.edu/beyerlein/irene/members/xu). Thus, it may not be update-to-date.

Based on this repository, my Ph.D. student [Anshu Raj](https://scholar.google.com/citations?user=3SNS6QsAAAAJ&hl=en) and I have created another GitHub repository named [LAMMPSatOU](https://github.com/ANSHURAJ11/LAMMPSatOU), providing guide on running LAMMPS simulations on University of Oklahoma supercomputer, [OSCER](https://www.ou.edu/oscer).

# Introduction

As a student in the Beyerlein group at UC Santa Barbara, you will learn atomistic simulations via LAMMPS on a UCSB cluster named Pod.

# Pod

1. [Request a user account](https://csc.cnsi.ucsb.edu/forms/user-account) at the Center for Scientific Computing at UCSB.
2. Wait for the user account to be approved --- you will receive an email. In what follows, I will assume that your account is `ucsb-intern` and your password is `ucsb-intern-pw`.
3. To use Pod, these webpages may help:
	- [HPC at UCSB](https://csc.cnsi.ucsb.edu/docs/getting-started-0)
	- [Pod](http://csc.cnsi.ucsb.edu/docs/pod-cluster)
	- [SLURM](https://slurm.schedmd.com/quickstart.html)
	- [SLURM at UCSB](https://csc.cnsi.ucsb.edu/docs/slurm-job-scheduler)

# UCSB VPN

To connect to Pod, you need the [UCSB VPN](https://www.it.ucsb.edu/vpn) unless you are using the [campus network](https://www.it.ucsb.edu/wireless-networking).

# FTP client

You need a file transfer protocol (FTP) client to transfer data between Pod and your local computer. Feel free to use any FTP client. Here is [a selected list](https://en.wikipedia.org/wiki/Comparison_of_FTP_client_software).

I personally recommend FileZilla. Below is an instruction:

1. Download and install [Filezilla Client](https://filezilla-project.org/) on your local computer.
2. Open it.
3. The first time you use it, File --> Site Manager --> New site --> rename it 'Pod', then in the window on the right hand side:
	- Protocol: SFTP - SSH File Transfer Protocol
	- Host: pod-login1.cnsi.ucsb.edu
	- Logon Type: Normal
	- User: ucsb-intern
	- Password: ucsb-intern-pw
	- Connect
4. The next time you use it, File --> Site Manager --> select 'Pod', then 'Connect'.
5. To transfer files between Pod and your local computer, please refer to [this page](https://wiki.filezilla-project.org/Using).

# Terminal emulator

You also need a terminal emulator to 'talk with' Pod, e.g., submit a job. Feel free to use any terminal emulator. Here is [a selected list](https://en.wikipedia.org/wiki/List_of_terminal_emulators).

On Windows, UCSB recommends [Putty](http://csc.cnsi.ucsb.edu/docs/windows-puttyxming).

On Mac and Linux, without installing any new emulator, you may open the default terminal and type

`ssh ucsb-intern@pod.cnsi.ucsb.edu`

then hit Return. Then you will be asked to provide your password. Type your own password, e.g.,

`ucsb-intern-pw`

then hit Return.

Note: Type the password anyway even though nothing is showing up

If you are not familiar with Linux, please refer to these webpages:

- [Ubuntu](https://ubuntu.com/tutorials/command-line-for-beginners#1-overview)
- [Basic Linux commands](https://www.hostinger.com/tutorials/linux-commands)

You also need a software package to edit text files on Pod. Again, feel free to use anything. Here is [a selected list](https://en.wikipedia.org/wiki/List_of_text_editors). I recommend vim, which is already installed on Pod (and most, if not all, Mac and Linux systems). If you are not familiar with vim, please refer to these webpages:

- [vim 101](https://www.engadget.com/2012-07-10-vim-how-to.html)
- [Getting started with vim](https://opensource.com/article/19/3/getting-started-vim)
- [A quick start guide for vim beginners](https://eastmanreference.com/a-quick-start-guide-for-beginners-to-the-vim-text-editor)

# LAMMPS

LAMMPS is an open-source software package for atomistic simulations. So you first need to understand how atomistic simulations work. There are three main types of atomistic simulation methods

- [Molecular dynamics (MD)](https://en.wikipedia.org/wiki/Molecular_dynamics)
- Molecular statics (MS)
- Monte Carlo method, e.g., [kinetic Monte Carlo](https://en.wikipedia.org/wiki/Kinetic_Monte_Carlo)

To learn the basics of MD and MS, please read, respectively, Chapter 9 and Chapter 6 of [this book](https://drive.google.com/file/d/0Bxsx9iwZLpZxS0RENllIRnd2LWc/view?usp=sharing&resourcekey=0--hdU-45Sb2q9H8VTZo_C9Q). The Google Drive link is private, so you need to request access.

And here are more references on MD:

- [Introduction to Molecular Dynamics Simulation](http://2009.igem.org/wiki/images/3/3e/Introduction_to_molecular_Dynamics_Simulation.pdf)
- [Basic Molecular Dynamics](http://li.mit.edu/Archive/Papers/05/Li05-2.8.pdf)
- [A Molecular Dynamics Primer](https://web.mst.edu/vojtat/class_5403/ercolessi.pdf)

To learn LAMMPS, you may start with [this page](https://lammps.sandia.gov/tutorials.html) and [this page](https://icme.hpc.msstate.edu/mediawiki/index.php/LAMMPS_tutorials.html).

Note: LAMMPS is installed on Pod, so you don't need to install it yourself.

# An example: Calculating the GSFE curve in a BCC metal

First, to understand the generalized stacking fault energy (GSFE) curve, read these materials:

- Sections 2 & 3 of: Shuozhi Xu, Yanqing Su, Lauren T.W. Smith, Irene J. Beyerlein, [Frank-Read source operation in six body-centered cubic refractory metals](http://dx.doi.org/10.1016/j.jmps.2020.104017), J. Mech. Phys. Solids 141 (2020) 104017
- Shuozhi Xu, Emily Hwang, Wu-Rong Jian, Yanqing Su, Irene J. Beyerlein, [Atomistic calculations of the generalized stacking fault energies in two refractory multi-principal element alloys](http://dx.doi.org/10.1016/j.intermet.2020.106844), Intermetallics 124 (2020) 106844

The GSFE curve is just one curve taken from the GSFE surface, also known as the &gamma;-surface, which is usually calculated in FCC metals. To know more about the GSFE surface, please read

- Yanqing Su, Shuozhi Xu, Irene J. Beyerlein, [Density functional theory calculations of generalized stacking fault energy surfaces for eight face-centered cubic transition metals](http://dx.doi.org/10.1063/1.5115282), J. Appl. Phys. 126 (2019) 105112

When you are ready to run simulations, download five files to a local directory `local_gsfe` on your local computer. The first four files can be downloaded from this GitHub repository, including

- `lmp_gsfe.batch`, which is for job submission
- `lmp_gsfe.data`, which is the LAMMPS data file
- `lmp_gsfe.in`, which is the LAMMPS input file
- `gsfe_curve.sh`, which is the post-processing bash script

The fifth file is

- `MoNbTi_A_atom.eam.alloy`, which is the interatomic potential file and can be downloaded from [this page](https://github.com/wrj2018/Intermetallics_2020)

Then on Pod, create a new directory in your `$HOME`. Say the directory is named `pod_gsfe`. The command is

`mkdir pod_gsfe`

Then upload, via Filezilla, the five files from your local computer to `pod_gsfe` on Pod. 

Then, in your terminal emulator, type

`cd pod_gsfe`

then hit Return. Then submit the job by typing

`sbatch lmp_gsfe.batch`

then hit Return. To check the status of the job, type

`squeue -u ucsb-intern`

then hit Return. You will see two lines. In the first line, there is a term `ST`, which stands for 'status'. If, at the same location of the second line, you see `PD`, the job is pending. Recheck the status later. If you see `R`, the job is running. If you only see one line, the job is finished. This, however, can mean one of the two things:

- The job was finished because of an error. In this case, check these three files: `lmp_gsfe.out`, `lmp_gsfe.err`, and `log.lammps`. They provide you information on what caused the error(s). In particular, the last file is the log file of LAMMPS, which would present an error message in the last line. Please refer to [this page](https://lammps.sandia.gov/doc/Errors_messages.html) for the explanation of each error message. Once you figure out what went wrong, fix the problem, and resubmit the job
- The job was finished successfully. In this case, the file `lmp_gsfe.err` is empty. Proceed to the next step.

You will find a lot of files in the directory. One file is called `gsfe_ori`. In the same directory on Pod, type

`sh gsfe_curve.sh`

then hit Return. You will find a new file called `gsfe`. The first and second columns of this file, respectively, are the _x_ and _y_ axes of the 'MoNbTi<sub>_A_</sub>' curve in Figure 2(a) of [this paper](http://dx.doi.org/10.1016/j.intermet.2020.106844). Download `gsfe` to your local computer, plot it, and see if you get the same curve.

As usual, feel free to use any software to plot the curve. Here is [a selected list](https://en.wikipedia.org/wiki/List_of_information_graphics_software). I recommend Gnuplot. There are many tutorials on Gnuplot, e.g., [this one](https://www.usm.uni-muenchen.de/CAST/talks/gnuplot.pdf).

Now, go back to the file `lmp_gsfe.in` and read it. Look up the meaning of each LAMMPS command on [this page](https://lammps.sandia.gov/doc/Commands_all.html).

Note: If you use any file from this section in your published work, please cite

- Shuozhi Xu, Emily Hwang, Wu-Rong Jian, Yanqing Su, Irene J. Beyerlein, [Atomistic calculations of the generalized stacking fault energies in two refractory multi-principal element alloys](http://dx.doi.org/10.1016/j.intermet.2020.106844), Intermetallics 124 (2020) 106844

# OVITO

In the directory on Pod, `pod_gsfe`, you will find a lot of dump files, which contain information of atomic positions. To visualize these files, download them, via Filezilla, to your local computer. Then install [OVITO](http://www.ovito.org/) on your computer. Read [this page](http://www.ovito.org/docs/current/) to learn how to use it.

# Another example: Calculating the Peierls stress of a screw dislocation in a BCC metal

First, to understand dislocations, I recommend these readings depending on how much you already know and how much more you want to know.

- Beginner-level:

	- D. Hull, D.J. Bacon, [Introduction of Dislocations](https://www.amazon.com/Introduction-Dislocations-Goldsmiths-Professor-University/dp/0080966721), 5th edition, 2011 [[PDF](https://drive.google.com/file/d/0Bxsx9iwZLpZxRktuUVozXzB6QWs/view?usp=sharing)]
	- Yu N Osetsky, D J Bacon, [An atomic-level model for studying the dynamics of edge dislocations in metals](http://dx.doi.org/10.1088/0965-0393/11/4/302), Modelling Simul. Mater. Sci. Eng. 11 (2003) 427
	- Wu-Rong Jian, Min Zhang, Shuozhi Xu, Irene J. Beyerlein, [Atomistic simulations of dynamics of an edge dislocation and its interaction with a void in copper: A comparative study](http://dx.doi.org/10.1088/1361-651X/ab8358), Modelling Simul. Mater. Sci. Eng. 28 (2020) 045004

- Intermediate-level:

	- D.J. Bacon, Y.N. Osetsky, D. Rodney, [Dislocation-obstacle interactions at the atomic level](http://dx.doi.org/10.1016/S1572-4859(09)01501-0), in _Dislocations in Solids_, 15 (2009) 1--90 [[PDF](http://ilm-perso.univ-lyon1.fr/~drodney/dr_articles/2009_Dislo_In_Solids%5BBacon_Osetsky_Rodney%5D.pdf)]
	- Jaehyun Cho, Till Junge, Jean-Fran&ccedil;ois Molinari, Guillaume Anciaux, [Toward a 3D coupled atomistic and discrete dislocation dynamics simulation: dislocation core structures and Peierls stresses with several character angles in FCC aluminum](http://dx.doi.org/10.1186/s40323-015-0028-6), Adv. Model. Simul. Eng. Sci. 2 (2015) 12
	- Vasily V. Bulatov, Wei Cai, [Computer Simulations of Dislocations](https://www.amazon.com/Computer-Simulations-Dislocations-Materials-Modelling/dp/0198526148), 2006 [[PDF](https://drive.google.com/file/d/0Bxsx9iwZLpZxMHl2cVp6QVdRWWM/view?usp=sharing)]
	- Johannes Weertman, Julia R. Weertman, [Elementary Dislocation Theory](https://www.amazon.com/Elementary-Dislocation-Theory-Johannes-Weertman/dp/0195069005), 1992

- Advanced-level:

	- Peter M. Anderson, John P. Hirth, Jens Lothe, [Theory of Dislocations](https://www.amazon.com/Theory-Dislocations-Peter-M-Anderson/dp/0521864364), 3rd edition, 2017

Some Google Drive links above are private. You may request access. To learn all kinds of defects in crystals, read [the website by Föll](https://www.tf.uni-kiel.de/matwis/amat/def_en/index.html) and/or [the book by Cai and Nix](https://www.cambridge.org/highereducation/books/imperfections-in-crystalline-solids/3A193C8DEF36073F9E2EF07EEA6A5D96#overview).

When you are ready to run simulations, download four files to a local directory `local_peierls` on your local computer. The first three files can be downloaded from this GitHub repository, including

- `lmp_peierls.batch`, which is for job submission
- `lmp_peierls.data`, which is the LAMMPS data file, containing a screw dislocation on the {112} plane
- `lmp_peierls.in`, which is the LAMMPS input file

The fourth file is

- `MoNbTi_A_atom.eam.alloy`, which is the interatomic potential file and can be downloaded from [this page](https://github.com/wrj2018/Intermetallics_2020)

Then on Pod, create a new directory, `pod_peierls`, in your `$HOME`, by typing

`mkdir pod_peierls`

then hit Return. Then upload, via Filezilla, the four files from your local computer to `pod_peierls` on Pod. 

Then, in your terminal emulator, type

`cd pod_peierls`

then hit Return. Then submit the job by typing

`sbatch lmp_peierls.batch`

then hit Return.

<a name="LSR"></a>After the job is finished, you will find a new file called `strain-stress`. The first and second columns of this file, respectively, are the _yz_ components of the strain tensor and stress tensor of the simulation cell. The strain is unitless and the stress is in units of MPa. Download `strain-stress` to your local computer, plot it, and you will see a point at which the stress-strain relation starts to deviate from linearity. Let's call it P1.

To visualize the dislocation core, download dump files to the same directory on your local computer. You do not need to download all of them at once, just selected ones, e.g., dump.0.load, dump.50.load, dump.100.load, ..., dump.500.load. Open any of them in OVITO by File --> Load File --> select the file --> Open. Then, Add modification --> Dislocation analysis (DXA), and change the "input crystal type" to "Body-centered cubic (BCC)". The blue and white atoms, respectively, are in BCC and disordered local structures. The green line is the dislocation line. White atoms exist in three locations: top layer, bottom layer, and center of the simulation cell. Those in the center are atoms in the dislocation core. Select one white atom using the [crosshair button](https://www.ovito.org/docs/current/data_inspector.particles.php).

Next, go through all dump files frame by frame in OVITO and pay attention to between which two frames the dislocation core starts to move along the positive _x_ direction. Why is this important? Because when the applied stress surpasses the Peierls stress, the dislocation line should [move from one Peierls valley to another](https://www.tf.uni-kiel.de/matwis/amat/def_en/kap_5/backbone/r5_3_1.html). Therefore, if the dislocation moves between one dump file and the next one, the Peierls stress is between the two stresses associated with these two dump files.

How do we determine whether the dislocation moves? Usually one of the two criteria is used: (i) does any white/blue atom become blue/white? (ii) does the green line move by a non-negligible distance? The keyword here is "non-negligible". Regardless of whether the Peierls stress has been reached, the green line may move a little bit between any two frames, especially when the dislocation is an edge dislocation. However, this may be because the entire simulation cell is sheared and so are all atoms within. If, from dump file A to dump file B, the dislocation moves a little bit, and from dump file B to dump file C, the dislocation moves by a longer distance, then likely the Peierls stress is reached somewhere between B and C.

Note: For a screw dislocation, it is important to check whether the dislocation moves within the _xz_ plane. In many cases, the screw dislocation immediately crosses slip to a plane that is not parallel to _xz_. For more on this topic, read [this paper](https://doi.org/10.1016/j.commatsci.2014.03.064). When this happens, the Peierls stress is not calculable. Write this down and move on to the next calculation. Sometimes the screw dislocation moves within the _xz_ plane by a certain distance, and then crosses slip. In this case, the Peierls stress is considered calculable. Note that an edge dislocation does not cross slip, so its Peierls stress should always be calculable.

In the example provided in this GitHub repository, the dislocation moves between `dump.350.load` and `dump.400.load`. Then download `dump.360.load`, `dump.370.load`, `dump.380.load`, and `dump.390.load` from Pod to the same directory (to which all previous dump files were downloaded) on your local computer. Open any dump file again in OVITO, by File --> Load File --> select the file --> Replace selected. Again, go through the newly downloaded dump files frame by frame and identify the two frames between which the dislocation core starts to move. The two frames are `dump.390.load` and `dump.400.load`.

Then download `dump.391.load`, `dump.392.load`, ..., `dump.399.load` to the same local directory. Open any dump file, go through these new dump files and identify the two frames between which the dislocation core starts to move. The two frames are `dump.393.load` and `dump.394.load`.

Then the Peierls stress is the stress of the simulation cell corresponding to `dump.393.load`. The strain and stress of the simulation cell at this point can be found in line 393 of the file `strain-stress`, and the corresponding stress is then the Peierls stress for the anti-twinning direction on the {112} plane in MoNbTi<sub>_A_</sub>, 1174 MPa. In the current case, the critical point associated with the Peierls stress is also P1 which was identified earlier.

In a general case, however,

- The dislocation core may move along the negative _x_ direction, depending on the Burgers vector of the dislocation and the shear direction.
- Sometimes there is more than one point on the stress-strain curve at which the stress-strain relation starts to deviate from linearity. Let's say there are three such points and we call them P1, P2, and P3. Then the point at which the dislocation core starts to move may be one of them, or none of them. In other words, do not assume that any of these points is the critical point associated with the Peierls stress. If the point at which the dislocation core starts to move does not correspond to any turning point identified on the stress-strain curve, go with the former point instead of the latter.

Note: If you use any file from this section in your published work, please cite

- Shuozhi Xu, Yanqing Su, Wu-Rong Jian, Irene J. Beyerlein, [Local slip resistances in equal-molar MoNbTi multi-principal element alloy](http://dx.doi.org/10.1016/j.actamat.2020.10.042), Acta Mater. 202 (2021) 68--79