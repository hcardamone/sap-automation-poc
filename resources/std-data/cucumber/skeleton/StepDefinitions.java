package com.xboxcatalog;

import io.cucumber.java.After;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class StepDefinitions {

    private final WebDriver driver = new FirefoxDriver();
    
    @Given("That xbox page was open")
    public void I_visit_google() {
        driver.get("https://www.xbox.com/en-us/games/all-games");
    }
}