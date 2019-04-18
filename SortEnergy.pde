class SortEnergy implements Comparator<Players>{
 public int compare(Players b, Players a)
    {
        return (int)a.energy - (int)b.energy;
    }


}