/*-------------------------------
 * Caltech CS 156: LEARNING SYSTEMS
 * Giri Gopalan
 * 10/11/08
 *-------------------------------*/
import java.lang.Math;
import java.util.Random;

public class NeuralNet
{
  /*-----------------------------------------------------------------------------------------------------------------------*/
  /*CLASS DATA
  /*-----------------------------------------------------------------------------------------------------------------------*/
  //stores the vector (d_0, d_1,..., d_L); i,.e the number of neurons in each layer
  public int[] num_of_neurons; 
  //height of the neural network
  public int L;
  //weight matrix, indexed by (layer, output neuron, input neuron)
  public double[][][] weights;
  //delta matrix
  public double[][] deltas;
  //matrix which stores the thresholded signals, i.e the x
  public double[][] signal;
  //learning rate constant
  public double learning_rate = .1;
  //weight decay constant
  public double lambda = 0;
  
  /*-----------------------------------------------------------------------------------------------------------------------*/
  /*CONSTRUCTOR: initializes a random weight matrix that has random values b/w (-2,2)
  /*-----------------------------------------------------------------------------------------------------------------------*/
  public NeuralNet(int[] specs, int height)
  {
	num_of_neurons = specs; 
	L = height;
	
	weights = new double[10][10][10];
	deltas = new double[10][10];
	signal  = new double[10][10];
	
	//generate a random weight matrix
	Random generator = new Random();
	for(int i = 1; i <=L; i++)
	{
		for (int j = 1; j <= num_of_neurons[i]; j++)
		{
			for(int k = 0; k <= num_of_neurons[i-1]; k++)
			{
				weights[i][j][k] = (generator.nextDouble()*4)-2; 
			}
		}
	}
  }
  /*-----------------------------------------------------------------------------------------------------------------------*/
  /*FORWARD_PASS: computes signals of the neurons in the network given input
  /*-----------------------------------------------------------------------------------------------------------------------*/
 public double forward_pass (double[] input)
  {
    //first copy input into the signal array
    signal[0][0] = -1;
	for(int i = 1; i <= num_of_neurons[0]; i++)
    {
    	signal[0][i] = input[i];
    }
	//main loop, goes from bottom layer to top layer computing the signal
    for(int i = 1; i <= L; i++)
    {
    	signal[i][0] = -1;
    	//compute the signal for each neuron of the current layer
    	for(int j = 1; j <= num_of_neurons[i]; j++)
    	{
    		signal[i][j] = crunch_signal(i,j);
    	}
    }
    return signal[L][1];
  }
 /*-----------------------------------------------------------------------------------------------------------------------*/
 /*TUNE_WEIGHTS: performs the backpropagation algorithm to compute deltas, and then adjusts weights accordingly
 /*-----------------------------------------------------------------------------------------------------------------------*/
 public boolean tune_weights(double y)
 {
  //compute the deltas, starting with the top most
    deltas[L][1] = 2*(signal[L][1]- y)*(1-Math.pow(signal[L][1], 2));
    for(int i = L-1; i > 0; i--) 
    {
	   for(int j = 1; j <= num_of_neurons[i]; j++)
	    {
		 deltas[i][j] = crunch_deltas(i, j);
        }
    }
    for(int level = 1 ; level <= L; level++)
    {
	   for(int j = 1; j <= num_of_neurons[level]; j++)
	   {
		   for(int i = 0; i <=num_of_neurons[level-1]; i++)
		   {
			   weights[level][j][i] = weights[level][j][i]- learning_rate*signal[level-1][i]*deltas[level][j];
		   }
	   }
    }
  return true;
 }
 /*-----------------------------------------------------------------------------------------------------------------------*/
 /*CRUNCH_SIGNAL: crunches the signal s for a given neuron at a given level
 /*-----------------------------------------------------------------------------------------------------------------------*/ 
public double crunch_signal(int level, int neuron)
  {
	 double s = 0;
	 for(int i = 0; i <= num_of_neurons[level-1]; i++)
	 {
		 s = s+weights[level][neuron][i]*signal[level-1][i];
	 }
    /*don't implement theta at the top layer
	 if(level == L) 
    	 return s;
     else*/
    	 return theta(s);  
  }
/*-----------------------------------------------------------------------------------------------------------------------*/
/*CRUNCH_DELTAS: crunches the delta for a given neuron at a given level
/*-----------------------------------------------------------------------------------------------------------------------*/
public double crunch_deltas(int level, int neuron)
{
	double s = 0;
	for(int j = 1; j <= num_of_neurons[level+1]; j++)
	{
		s = s+weights[level+1][j][neuron]*deltas[level+1][j];
	}
    return (1-Math.pow(signal[level][neuron], 2))*s;
}
/*-----------------------------------------------------------------------------------------------------------------------*/
/*THETA: soft thresholding function
/*-----------------------------------------------------------------------------------------------------------------------*/
  public double theta(double s)
  {
	  return ((Math.exp(s)-Math.exp(-s))/(Math.exp(s)+Math.exp(-s)));
  }
}
