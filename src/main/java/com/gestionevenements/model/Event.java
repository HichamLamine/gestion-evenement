package com.gestionevenements.model;

import java.time.LocalDate;

public class Event {
    private int id;
    private String title;
    private LocalDate date;
    private String location;
    private int capacity;

    public Event(int id, String title, LocalDate date, String location, int capacity) {
        this.id = id;
        this.title = title;
        this.date = date;
        this.location = location;
        this.capacity = capacity;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public LocalDate getDate() {
        return date;
    }

    public String getLocation() {
        return location;
    }

    public int getCapacity() {
        return capacity;
    }

}
