FROM jgwill/ubunpy-conda





# Run Jupytewr notebook as Docker main process
#@stcgoal Maybe useful later
#CMD ["jupyter", "notebook", "--allow-root", "--notebook-dir=/home/ubuntu/notebooks", "--ip='*'", "--port=8888", "--no-browser"]


####################### Part to make US works, above can be considered as a base for AI systems#########
USER root
RUN conda config --set auto_activate_base false
RUN conda install pytorch torchvision cpuonly -c pytorch





################ scikit-image ######################
RUN conda install -y scikit-image


##################### INSTALLING US Prereq ##############################
USER root
RUN apt-get install -y build-essential cmake libgtk2.0-dev pkg-config 
RUN apt-get install -y python3-numpy python3-dev 
#COPY install_opencv2_ubuntu.sh . 
#COPY install_opencv2_ubuntu__jgwill.sh .
#@STCIssue : some package are not installing
#@STCGoal  Migrating from the script what works 
#issue --> installing Python 2

# New approach from : https://linuxize.com/post/how-to-install-opencv-on-ubuntu-20-04/
RUN apt-get install -y libopencv-dev python3-opencv

RUN conda update -y anaconda-navigator  
RUN conda update -y navigator-updater
# Now following https://stackoverflow.com/questions/19876079/cannot-find-module-cv2-when-using-opencv
RUN pip install opencv-python
