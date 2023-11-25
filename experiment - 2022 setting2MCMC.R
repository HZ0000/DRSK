source('simulation.r')
#source('E:\\R-4.1.3\\computer_network\\computer_network\\experiment1\\simulation.r')
getwd()
# system information
proc_time <- 0.001
queue_speed <- 275000
trans_speed <- 150000
chan_length <- 100*(1:4)
horizon <- 30
path <- list()
path[[1]] <- c(1, 5, 2)
path[[2]] <- c(1, 5, 2, 6, 3)
path[[3]] <- c(1, 5, 2, 7, 4)
path[[4]] <- c(2, 5, 1)
path[[5]] <- c(2, 6, 3)
path[[6]] <- c(2, 7, 4)
path[[7]] <- c(3, 6, 2, 5, 1)
path[[8]] <- c(3, 6, 2)
path[[9]] <- c(3, 8, 4)
path[[10]] <- c(4, 7, 2, 5, 1)
path[[11]] <- c(4, 7, 2)
path[[12]] <- c(4, 8, 3)




log_target1 = function(x){
  return(dgamma(x, shape=20, scale = 1/0.3, log=TRUE))
}
log_target2 = function(x){
  return(dgamma(x, shape=20, scale = 1/0.5, log=TRUE))
}
log_target3 = function(x){
  return(dgamma(x, shape=20, scale = 1/0.4, log=TRUE))
}
log_target4 = function(x){
  return(dgamma(x, shape=20, scale = 1/0.2, log=TRUE))
}
log_target5 = function(x){
  return(dgamma(x, shape=20, scale = 1/0.3, log=TRUE))
}
log_target6 = function(x){
  return(dgamma(x, shape=20, scale = 1/1.1, log=TRUE))
}
log_target7 = function(x){
  return(dgamma(x, shape=20, scale = 1/0.2, log=TRUE))
}
log_target8 = function(x){
  return(dgamma(x, shape=20, scale = 1/1.0, log=TRUE))
}
log_target9 = function(x){
  return(dgamma(x, shape=20, scale = 1/0.9, log=TRUE))
}
log_target10 = function(x){
  return(dgamma(x, shape=20, scale = 1/0.5, log=TRUE))
}
log_target11 = function(x){
  return(dgamma(x, shape=20, scale = 1/0.4, log=TRUE))
}
log_target12 = function(x){
  return(dgamma(x, shape=20, scale = 1/0.3, log=TRUE))
}
easyMCMC = function(log_target, niter, startval, proposalsd){
  x = rep(0,niter)
  x[1] = startval     
  for(i in 2:niter){
    currentx = x[i-1]
    proposedx = rnorm(1,mean=currentx,sd=proposalsd) 
    A = exp(log_target(proposedx) - log_target(currentx))
    if(runif(1)<A){
      x[i] = proposedx       # accept move with probabily min(1,A)
    } else {
      x[i] = currentx        # otherwise "reject" move, and stay where we are
    }
  }
  return(x[niter])
}


# true input model
# input_true <- c(60, 40, 50, 80, 65, 20, 100, 22, 26, 40, 50, 60, 1/300)
# input_true <- c(50, 30, 40, 60, 55, 20, 70, 22, 26, 35, 40, 50, 1/300)
#input_true <- c(40, 30, 35, 50, 45, 15, 60, 15, 20, 25, 30, 40, 1/300)
# input_true <- c(50, 40, 45, 60, 55, 25, 70, 25, 30, 35, 40, 50, 1/300)
#print(input_true)

samplesize <- 4000
numit1 <- 20
jumvar <- 20
arr_in = matrix(0, nrow = samplesize, ncol = 13)
#arr = array(1:1, dim = c(550, 2, 50))
#arr[120,1] <- 3
toto <- 0

# set seed for rng
#set.seed(322277)
# compute the true value
#for (j in 1:50){
for (i in 1:samplesize) {
  #print(i)
  beggg = rgamma(12, shape=10, scale = 1/0.1)
  aa1 <- easyMCMC(log_target1, numit1, beggg[1],jumvar)
  aa2 <- easyMCMC(log_target2, numit1, beggg[2],jumvar)
  input_raw <- c(aa1, aa2)
  input_raw <- c(input_raw, easyMCMC(log_target3, numit1, beggg[3],jumvar))
  input_raw <- c(input_raw, easyMCMC(log_target4, numit1, beggg[4],jumvar))
  input_raw <- c(input_raw, easyMCMC(log_target5, numit1, beggg[5],jumvar))
  input_raw <- c(input_raw, easyMCMC(log_target6, numit1, beggg[6],jumvar))
  input_raw <- c(input_raw, easyMCMC(log_target7, numit1, beggg[7],jumvar))
  input_raw <- c(input_raw, easyMCMC(log_target8, numit1, beggg[8],jumvar))
  input_raw <- c(input_raw, easyMCMC(log_target9, numit1, beggg[9],jumvar))
  input_raw <- c(input_raw, easyMCMC(log_target10, numit1, beggg[10],jumvar))
  input_raw <- c(input_raw, easyMCMC(log_target11, numit1, beggg[11],jumvar))
  input_raw <- c(input_raw, easyMCMC(log_target12, numit1, beggg[12],jumvar))
  arr_in[i,1:12] <- input_raw
  input_true <- c(input_raw, 1/300)
  truth <- get_truth(input_true, 100)
  #save(truth, file = 'truth.RData')
  truth <- truth$mean
  arr_in[i,13] <- truth
  toto <- toto + truth
}

print('finish computing truth')
#print(arr_in)
print(toto/samplesize)
write.csv(arr_in, file = "CF2-100mean-MCMC1.csv")

#}

