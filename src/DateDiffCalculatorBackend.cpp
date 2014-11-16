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
#include <QStringList>

#include "DateDiffCalculatorBackend.h"

#include "qtimespan.h"

DateDiffCalculatorBackend::DateDiffCalculatorBackend(QObject *parent)
    : QObject(parent)
{
    resetStartEndDate();
}

QString
normalizeFloatStr(const QString &in) {
    if (in == "0.0") return QString();
    if (in.endsWith(".0")) {
        return in.split(".")[0];
    }
    return in;
}

void
DateDiffCalculatorBackend::updateDiff() {
    diffInDays   = QString();
    diffInWeeks  = QString();
    diffInMonths = QString();
    diffInYears  = QString();

    QTimeSpan span = endDate - startDate;

    int diffDays = qRound(span.toDays());
    qDebug() << "updateDiff called, diff in days" << diffDays << ", raw diff in days" << span.toDays();

    if (diffDays != 0) {
        diffDays = qAbs(diffDays);
        diffInDays = QString::number(diffDays);
        diffInDays += diffDays == 1 ? " day" : " days";

        qreal diffMonths = span.toMonths();
        qreal diffYears = span.toYears();
        qreal diffWeeks = span.toWeeks();

        QString monthsStr = QString::number(diffMonths, 'f', 1);
        QString yearsStr = QString::number(diffYears, 'f', 1);
        QString weeksStr = QString::number(diffWeeks, 'f', 1);
        monthsStr = normalizeFloatStr(monthsStr);
        yearsStr = normalizeFloatStr(yearsStr);
        weeksStr = normalizeFloatStr(weeksStr);

        if (!weeksStr.isEmpty())
            diffInWeeks = "or " + weeksStr + (weeksStr == "1" ? " week" : " weeks");
        if (!monthsStr.isEmpty())
            diffInMonths = "or " + monthsStr + (monthsStr == "1" ? " month" : " months");
        if (!yearsStr.isEmpty())
            diffInYears = "or " + yearsStr + (yearsStr == "1" ? " year" : " years");
        if (!yearsStr.isEmpty())
            diffInYears = "or " + yearsStr + (yearsStr == "1" ? " year" : " years");
    }
    emit diffInDaysChanged();
    emit diffInWeeksChanged();
    emit diffInMonthsChanged();
    emit diffInYearsChanged();
}
