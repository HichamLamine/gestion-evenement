package com.gestionevenements.dao;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import com.gestionevenements.model.Event;

public class EventDao {

    private static final List<Event> MOCK_EVENTS = List.of(
            new Event(1, "AppsClub Conference", LocalDate.of(2026, 11, 20), "Ensa Agadir", 100),
            new Event(2, "Introduction to Rust", LocalDate.of(2026, 11, 25), "Amphithéâtre", 40),
            new Event(3, "Nvidia Conference", LocalDate.of(2026, 12, 2), "Salle A1", 60));

    public List<Event> findAll() {
        return MOCK_EVENTS;
    }

    public Optional<Event> find(int id) {
        return MOCK_EVENTS.stream().filter(e -> e.getId() == id).findFirst();
    }
}
