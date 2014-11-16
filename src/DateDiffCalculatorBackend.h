/**********************************************************************
 * Copyright 2013 Arto Jalkanen
 *
 * This file is part of Date Difference Calculator
 *
 * Date Difference Calculator is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Date Difference Calculator is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Date Difference Calculator.  If not, see <http://www.gnu.org/licenses/>
**/
#ifndef DateDiffCalculatorBackend_H_
#define DateDiffCalculatorBackend_H_

#include <QObject>
#include <QDateTime>
#include <QString>
#include <QDebug>

class DateDiffCalculatorBackend : public QObject
{
    Q_OBJECT

    QDateTime startDate;
    QDateTime endDate;
    QString diffInDays;
    QString diffInWeeks;
    QString diffInMonths;
    QString diffInYears;

    void updateDiff();

    Q_PROPERTY(QDateTime startDate  READ getStartDate     WRITE setStartDate  NOTIFY startDateChanged)
    Q_PROPERTY(QDateTime endDate    READ getEndDate       WRITE setEndDate    NOTIFY endDateChanged)
    Q_PROPERTY(QString diffInDays   READ getDiffInDays   NOTIFY diffInDaysChanged   STORED false)
    Q_PROPERTY(QString diffInWeeks  READ getDiffInWeeks  NOTIFY diffInWeeksChanged STORED false)
    Q_PROPERTY(QString diffInMonths READ getDiffInMonths NOTIFY diffInMonthsChanged STORED false)
    Q_PROPERTY(QString diffInYears  READ getDiffInYears  NOTIFY diffInYearsChanged  STORED false)

    Q_INVOKABLE void resetStartEndDate() {
        startDate = normalizedDateTime(QDateTime::currentDateTime());
        endDate = normalizedDateTime(QDateTime::currentDateTime());
    }

    QDateTime normalizedDateTime(const QDateTime &dateTime) {
        QDateTime normalized = QDateTime(dateTime);
        QTime time = QTime(12, 0);
        normalized.setTime(time);
        return normalized;
    }

public:
    DateDiffCalculatorBackend(QObject *parent = 0);
    virtual ~DateDiffCalculatorBackend() {}

    Q_INVOKABLE void reset() {
        resetStartEndDate();
        startDateChanged();
        endDateChanged();
        updateDiff();
    }

    inline const QDateTime &getStartDate()   const { return startDate; }
    inline void setStartDate(const QDateTime &dateTime) {
        qDebug() << "Setting start date to " << dateTime;
        startDate = normalizedDateTime(dateTime);
        startDateChanged();
        updateDiff();
    }

    inline const QDateTime &getEndDate()   const { return endDate; }
    inline void setEndDate(const QDateTime &dateTime) {
        qDebug() << "Setting end date to " << dateTime;
        endDate = normalizedDateTime(dateTime);
        endDateChanged();
        updateDiff();
    }

    inline const QString &getDiffInDays()   const { return diffInDays; }
    inline const QString &getDiffInWeeks() const { return diffInWeeks; }
    inline const QString &getDiffInMonths() const { return diffInMonths; }
    inline const QString &getDiffInYears()  const { return diffInYears; }

signals:
    void startDateChanged();
    void endDateChanged();

    void diffInDaysChanged();
    void diffInWeeksChanged();
    void diffInMonthsChanged();
    void diffInYearsChanged();

};


#endif /* DateDiffCalculatorBackend_H_ */
