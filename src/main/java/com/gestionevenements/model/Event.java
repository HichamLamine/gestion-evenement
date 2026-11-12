package com.gestionevenements.model;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "events")
public class Event {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String title;
    private LocalDate date;
    private String location;
    private int capacity;

    protected Event() {
    }

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
