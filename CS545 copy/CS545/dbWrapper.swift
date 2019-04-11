//
//  dbWrapper.swift
//  CS545
//
//  Created by David Kim on 4/7/19.
//  Copyright © 2019 David Kim. All rights reserved.
//

import SQLite

class dbWrapper {
    static let instance = dbWrapper()
    private let db: Connection?
    
    
    private let sessions_table = Table("sessions_table")
    
//    private let session_id = Expression<String>("session_id")
    private let id = Expression<Int64>("id")
    private let session_date = Expression<String>("session_date")
    private let occasion = Expression<String>("occasion")
    private let occasion_date = Expression<String>("occasion_date")
    private let course_name = Expression<String>("course_name")
    private let address_of_session = Expression<String>("address_of_session")
    private let organizer_name = Expression<String>("organizer_name")
    
    private init() {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        do {
            db = try Connection("\(path)/db.sqlite3")
        } catch {
            db = nil
            print ("Unable to open database")
        }
        createTable()
    }
    func createTable() {
        do {
            try db!.run(sessions_table.create { t in
                t.column(id, primaryKey: true)
                t.column(session_date)
                t.column(occasion)
                t.column(occasion_date)
                t.column(course_name)
                t.column(address_of_session)
                t.column(organizer_name)
            })
        } catch {
            print("Unable to create table")
        }
    }
    func addSession(sess: Session) -> Int64 {
        do {
            let insert = sessions_table.insert(
                session_date    <- sess.sessionDate,
                occasion        <- sess.occasion,
                occasion_date   <- sess.occasionDate,
                course_name     <- sess.courseName,
                address_of_session <- sess.addressOfSession,
                organizer_name  <- sess.organizer)
            let id = try db!.run(insert)
            return id
        } catch {
            print("Insert failed")
            return -1
        }
    }
    func addSession(sdate: String, occ: String, odate: String, cname: String, address: String, oname: String) -> Int64 {
        do {
            let insert = sessions_table.insert(
                session_date        <- sdate,
                occasion            <- occ,
                occasion_date       <- odate,
                course_name         <- cname,
                address_of_session  <- address,
                organizer_name      <- oname)
            let id = try db!.run(insert)
            return id
        } catch {
            print("Insert failed")
            return -1
        }
    }
    func getSessions() -> [Session] {
        var sessions = [Session]()
        do {
            for session in try db!.prepare(self.sessions_table) {
                sessions.append(Session(
                    courseName      : session[course_name],
                    sessionDate     : session[session_date],
                    occasionDate    : session[occasion_date],
                    addressOfSession: session[address_of_session],
                    occasion        : session[occasion],
                    organizer       : session[organizer_name]))
            }
        } catch {
            print("Select failed")
        }
        
        return sessions
    }
    func deleteSession(sid: Int64) -> Bool {
        do {
            let session = sessions_table.filter(id == sid)
            try db!.run(session.delete())
            return true
        } catch {
            print("Delete failed")
        }
        return false
    }
    func updateSession(sid: Int64, newSession: Session) -> Bool {
        let session = sessions_table.filter(id == sid)
        do {
            let update = session.update([
                course_name         <- newSession.courseName,
                session_date        <- newSession.sessionDate,
                occasion_date       <- newSession.occasionDate,
                address_of_session  <- newSession.addressOfSession,
                occasion            <- newSession.occasion,
                organizer_name      <- newSession.organizer,
                ])
            if try db!.run(update) > 0 {
                return true
            }
        } catch {
            print("Update failed: \(error)")
        }
        
        return false
    }
}

