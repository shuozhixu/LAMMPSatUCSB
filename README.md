# Introduction

As an intern in the Beyerlein group at UC Santa Barbara, you will learn atomistic simulations via LAMMPS on a UCSB cluster named Pod.

# Pod

1. [Request a user account](http://csc.cnsi.ucsb.edu/acct) at the Center for Scientific Computing at UCSB
2. Wait for the user account to be approved --- you will receive an email
3. [Request an account on Pod](http://csc.cnsi.ucsb.edu/content/pod-account)
4. Wait for the Pod account to be approved --- you will receive an email. In what follows, I will assume that your account is 'ucsb-intern' and your password is 'ucsb-intern-pw'
5. To help you use Pod, or any HPC cluster in general, please refer to these webpages:
	- [HPC at UCSB](http://csc.cnsi.ucsb.edu/sites/csc.cnsi.ucsb.edu/files/docs/hpcintro_2018_0.pdf)
	- [Pod](http://csc.cnsi.ucsb.edu/docs/pod-cluster)
	- [SLURM](https://slurm.schedmd.com/quickstart.html)
	- [SLURM at UCSB](https://csc.cnsi.ucsb.edu/docs/slurm-job-scheduler)

# Filezilla

1. Download and install [Filezilla Client](https://filezilla-project.org/)
2. The first time you use it, File --> Site Manager --> New site --> rename it to 'Pod', then in the window on the right hand side:
	- Protocol: SFTP - SSH File Transfer Protocol
	- Host: pod-login1.cnsi.ucsb.edu
	- Logon Type: Normal
	- User: ucsb-intern
	- Password: ucsb-intern-pw
	- Connect
3. The next time you use it, File --> Site Manager --> select 'Pod', then 'Connect'
4. To transfer files between Pod and your own machine, please refer to [this page](https://wiki.filezilla-project.org/Using)

# Terminal

On Windows, UCSB recommends [Putty](http://csc.cnsi.ucsb.edu/docs/windows-puttyxming).

On Mac and Linux, you may open a terminal and type

`ssh ucsb-intern@pod.cnsi.ucsb.edu`

then hit Return. Then you will be asked to provide your password, type your own password, e.g.,

`ucsb-intern-pw`

then hit Return.

Note: Type the password anyway even though nothing is showing up

If you are not familiar with Linux, please refer to these webpages:

- [Ubuntu](https://ubuntu.com/tutorials/command-line-for-beginners#1-overview)
- [Basic Linux commands](https://www.hostinger.com/tutorials/linux-commands)

# Use LAMMPS on Pod

Make a new directory in your `$HOME` on Pod. Say the directory is named `ucsb-intern-test`. Upload, via Filezilla, the five files from your local machine to that `ucsb-intern-test` on Pod. The five files are

- `lmp.batch`, which is for job submission
- `lmp.data`, which is the LAMMPS data file
- `lmp.in`, which is the LAMMPS input file
- `MoNbTi_A_atom.eam.alloy`, which is an interatomic potential file developed by [Wu-Rong Jian](https://github.com/wrj2018/Intermetallics_2020)
- `gsfe_curve.sh`, which is the post-processing bash script

In your terminal

`cd ucsb-intern-test`

Submit the job

`sbatch lmp.batch`

To check the status of the job

`squeue -u ucsb-intern`

or

`qstat -u ucsb-intern`

Once the job is finished, you will find a lot of files in the directory. One of the file is called `gsfe_ori`, then run

`sh gsfe_curve.sh`

You will find a new file called `gsfe`. The first and second column of this file, respectively, is the _x_ and _y_ axis of the 'MoNbTi<sub>_A_</sub>' curve in Figure 2(a) of [this paper](http://dx.doi.org/10.1016/j.intermet.2020.106844). Plot the curve using `gsfe` and see if you get the same curve.

Now, go back to the file `lmp.in` and read it. Look up the meaning of each LAMMPS command on [this page](https://lammps.sandia.gov/doc/Commands_all.html).

# OVITO

In the directory, `ucsb-intern-test`, you will find a lot of dump files, which contain information of atomic positions. To visualize these files, download them, via Filezilla, to your local machine. Then install [OVITO](http://www.ovito.org/) on your computer. Read [this page](http://www.ovito.org/docs/current/) to learn how to use it.