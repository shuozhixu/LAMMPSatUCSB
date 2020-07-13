# Introduction

As an intern in the Beyerlein group at UC Santa Barbara, you will learn atomistic simulations via LAMMPS on a UCSB cluster named Pod.

# Pod

1. [Request a user account](http://csc.cnsi.ucsb.edu/acct) at the Center for Scientific Computing at UCSB.
2. Wait for the user account to be approved --- you will receive an email.
3. [Request an account on Pod.](http://csc.cnsi.ucsb.edu/content/pod-account)
4. Wait for the Pod account to be approved --- you will receive an email. In what follows, I will assume that your account is `ucsb-intern` and your password is `ucsb-intern-pw`.
5. To use Pod, these webpages may help:
	- [HPC at UCSB](http://csc.cnsi.ucsb.edu/sites/csc.cnsi.ucsb.edu/files/docs/hpcintro_2018_0.pdf)
	- [Pod](http://csc.cnsi.ucsb.edu/docs/pod-cluster)
	- [SLURM](https://slurm.schedmd.com/quickstart.html)
	- [SLURM at UCSB](https://csc.cnsi.ucsb.edu/docs/slurm-job-scheduler)

# UCSB VPN

To connect to Pod, you need the [UCSB VPN](https://www.it.ucsb.edu/vpn) unless you are using the [campus network](https://www.it.ucsb.edu/wireless-networking).

# FTP Client

You need a file transfer protocol (FTP) client to transfer data between Pod and your own computer. Feel free to use any FTP client. Here is [a selected list](https://en.wikipedia.org/wiki/Comparison_of_FTP_client_software).

I personally recommend FileZilla. Below is an instruction:

1. Download and install [Filezilla Client](https://filezilla-project.org/) on your own computer.
2. Open it.
3. The first time you use it, File --> Site Manager --> New site --> rename it 'Pod', then in the window on the right hand side:
	- Protocol: SFTP - SSH File Transfer Protocol
	- Host: pod-login1.cnsi.ucsb.edu
	- Logon Type: Normal
	- User: ucsb-intern
	- Password: ucsb-intern-pw
	- Connect
4. The next time you use it, File --> Site Manager --> select 'Pod', then 'Connect'.
5. To transfer files between Pod and your own computer, please refer to [this page](https://wiki.filezilla-project.org/Using).

# Terminal Emulator

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

You also need a software to edit text files on Pod. Again, feel free to use anything. Here is [a selected list](https://en.wikipedia.org/wiki/List_of_text_editors). I recommend vim, which is already installed on Pod (and most, if not all, Mac and Linux systems). If you are not familiar with vim, please refer to these webpages:

- [vim 101](https://www.engadget.com/2012-07-10-vim-how-to.html)
- [Getting started with vim](https://opensource.com/article/19/3/getting-started-vim)
- [A quick start guide for vim beginners](https://eastmanreference.com/a-quick-start-guide-for-beginners-to-the-vim-text-editor)

# LAMMPS

LAMMPS is an open-source software for atomistic simulations. So you first need to understand how atomistic simulations work. There are three main types of atomistic simulation methods

- [Molecular dynamics (MD)](https://en.wikipedia.org/wiki/Molecular_dynamics)
- Molecular statics (MS)
- Monte Carlo method, e.g., [kinetic Monte Carlo](https://en.wikipedia.org/wiki/Kinetic_Monte_Carlo)

To learn the basics of MD and MS, please read, respectively, Chapter 9 and Chapter 6 of [this book](https://drive.google.com/file/d/0Bxsx9iwZLpZxS0RENllIRnd2LWc/view?usp=sharing). The Google Drive link is private. To have access, [email me](mailto:shuozhixu@ucsb.edu) amd let me know the email address associated with your Google Drive.

And here are more references on MD:

- [Introduction to Molecular Dynamics Simulation](http://2009.igem.org/wiki/images/3/3e/Introduction_to_molecular_Dynamics_Simulation.pdf)
- [Basic Molecular Dynamics](http://li.mit.edu/Archive/Papers/05/Li05-2.8.pdf)
- [A Molecular Dynamics Primer](http://cms.sjtu.edu.cn/doc/reading/md/A_Molecular_Dynamics_Primer_(Ercolessi).pdf)

To learn LAMMPS, you may start with [this page](https://lammps.sandia.gov/tutorials.html) and [this page](https://icme.hpc.msstate.edu/mediawiki/index.php/LAMMPS_tutorials).

# Use LAMMPS on Pod

LAMMPS is installed on Pod, so you don't need to install it yourself. 

First, on your own computer, download these five files to a local directory `local_gsfe` from this github repository. They are

- `lmp_gsfe.batch`, which is for job submission
- `lmp_gsfe.data`, which is the LAMMPS data file
- `lmp_gsfe.in`, which is the LAMMPS input file
- `MoNbTi_A_atom.eam.alloy`, which is an interatomic potential file developed by [Wu-Rong Jian](https://github.com/wrj2018/Intermetallics_2020)
- `gsfe_curve.sh`, which is the post-processing bash script

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

# OVITO

In the directory on Pod, `pod_gsfe`, you will find a lot of dump files, which contain information of atomic positions. To visualize these files, download them, via Filezilla, to your local computer. Then install [OVITO](http://www.ovito.org/) on your computer. Read [this page](http://www.ovito.org/docs/current/) to learn how to use it.

# Another LAMMPS example

First, on your own computer, download these four files to a local directory `local_peierls` from this github repository. They are

- `lmp_peierls.batch`, which is for job submission
- `lmp_peierls.data`, which is the LAMMPS data file
- `lmp_peierls.in`, which is the LAMMPS input file
- `MoNbTi_A_atom.eam.alloy`, which is an interatomic potential file developed by [Wu-Rong Jian](https://github.com/wrj2018/Intermetallics_2020)

Then on Pod, create a new directory, `pod_peierls`, in your `$HOME`, by typing

`mkdir pod_peierls`

then hit Return. Then upload, via Filezilla, the four files from your local computer to `pod_peierls` on Pod. 

Then, in your terminal emulator, type

`cd pod_peierls`

then hit Return. Then submit the job by typing

`sbatch lmp_peierls.batch`

then hit Return.

After the job is finished, you will find a new file called `strain-stress`. The first and second columns of this file, respectively, are the _yz_ components of the strain tensor and stress tensor of the simulation cell. The strain is unitless and the stress is in units of MPa. Download `strain-stress` to your local computer, plot it, and you will see a point at which the stress-strain relation starts to deviate from linearity. Visualize the dump files in OVITO, and you will see that at that point, the screw dislocation starts to move along the positive _x_ direction. The corresponding stress is then the Peierls stress for the anti-twinning direction on the {112} plane in MoNbTi<sub>_A_</sub>, 1174 MPa.