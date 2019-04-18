class SortFitness implements Comparator<Coach>{
 public int compare(Coach b, Coach a)
    {
        return (int)a.fitness - (int)b.fitness;
    }


}