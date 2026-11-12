package com.gestionevenements.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public final class HibernateUtil {
    private static final SessionFactory SF = new Configuration().configure().buildSessionFactory();

    private HibernateUtil() {
    }

    public static SessionFactory get() {
        return SF;
    }

    public static void shutdown() {
        SF.close();
    }
}
