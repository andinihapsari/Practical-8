package TestSuite;
import com.intuit.karate.junit5.Karate;
class Runner {
    @Karate.Test
    public Karate runMealPlan(){
        return Karate.run("MealPlan/mealplan").relativeTo((getClass()));
    }

    @Karate.Test
    public Karate runMisc(){
        return Karate.run("Misc/misc").relativeTo((getClass()));
    }
    @Karate.Test
    public Karate runRecipes(){
        return Karate.run("Recipes/recipes").relativeTo((getClass()));
    }
}
