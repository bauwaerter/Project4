package sean;

import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import weka.attributeSelection.*;
import weka.core.*;
import weka.core.converters.ConverterUtils.*;
import weka.classifiers.*;
import weka.classifiers.meta.*;
import weka.classifiers.trees.*;
import weka.filters.*;

import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import weka.classifiers.functions.SimpleLogistic;
import weka.filters.unsupervised.attribute.Remove;

/**
 * performs attribute selection using CfsSubsetEval and GreedyStepwise
 * (backwards) and trains J48 with that. Needs 3.5.5 or higher to compile.
 *
 * @author FracPete (fracpete at waikato dot ac dot nz)
 */



public class AttributeSel {

    public String output;
    int[] selected ;
    public AttributeSel()  {
      
            
            // load dataSystem.out.println("\n0. Loading data");
            DataSource source;
      try {
          //C:\\Users\\Sean\\Desktop\\Fall 14\\Health DBs\\
          
          Path temp = Paths.get("proj3fixed.arff");
          String p =temp.toAbsolutePath().toString();
          source = new DataSource( p);//"\\src\\proj3fixed.arff");
      
            Instances data = source.getDataSet();
            data.setClassIndex(5);            
            
            output = useLowLevel(data);
          
            } catch (Exception ex) {
          Logger.getLogger(AttributeSelection.class.getName()).log(Level.SEVERE, null, ex);
      }
    }
  /**
   * uses the meta-classifier
   */
  protected static String useClassifier(Instances data) throws Exception {
    System.out.println("\n1. Meta-classfier");
    AttributeSelectedClassifier classifier = new AttributeSelectedClassifier();
    CfsSubsetEval eval = new CfsSubsetEval();
    GreedyStepwise search = new GreedyStepwise();
    search.setSearchBackwards(true);
    SimpleLogistic base = new SimpleLogistic();
    classifier.setClassifier(base);
    classifier.setEvaluator(eval);
    classifier.setSearch(search);
    Evaluation evaluation = new Evaluation(data);
    evaluation.crossValidateModel(classifier, data, 5, new Random(1));
    return  evaluation.toSummaryString(true)+evaluation.toClassDetailsString();
  }

  /**
   * uses the filter
   */
  protected static void useFilter(Instances data) throws Exception {
    System.out.println("\n2. Filter");
    weka.filters.supervised.attribute.AttributeSelection filter = new weka.filters.supervised.attribute.AttributeSelection();
    CfsSubsetEval eval = new CfsSubsetEval();
    GreedyStepwise search = new GreedyStepwise();
    search.setSearchBackwards(true);
    filter.setEvaluator(eval);
    filter.setSearch(search);
    filter.setInputFormat(data);
    Instances newData = Filter.useFilter(data, filter);
    System.out.println(newData);
  }

  /**
   * uses the low level approach
   */
  protected static String useLowLevel(Instances data) throws Exception {
    System.out.println("\n3. Low-level");
    AttributeSelection attsel = new AttributeSelection();
    CfsSubsetEval eval = new CfsSubsetEval();
    GreedyStepwise search = new GreedyStepwise();
    search.setSearchBackwards(true);
    attsel.setEvaluator(eval);
    attsel.setSearch(search);
    attsel.SelectAttributes(data);
    
    
    SimpleLogistic base = new SimpleLogistic();
    
    Instances newInst;
    
    
     Remove remove = new Remove();
     remove.setAttributeIndicesArray(attsel.selectedAttributes());
     remove.setInvertSelection(true);
     remove.setInputFormat(data);
    newInst = Filter.useFilter(data, remove);
    base.buildClassifier(newInst);
    
    
    return base.toString();
    
  }
            
            
         
      
      
      
    
}