<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="AvisSystem.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    

    <style>
        .about-page { padding: 30px; background: #f7f7f7; min-height: calc(100vh - 70px); }
        .about-wrap { max-width: 1000px; margin: 0 auto; }
        .about-title { font-size: 30px; font-weight: 700; margin-bottom: 5px; color: #222; }
        .about-subtitle { color: #777; margin-bottom: 25px; }

        .about-card { background: #fff; padding: 28px 30px; border-radius: 12px; border: 1px solid #e5e5e5;
                      box-shadow: 0 3px 10px rgba(0,0,0,0.05); margin-bottom: 20px; }
        .about-card h3 { margin: 0 0 12px; font-size: 18px; color: #c8102e; }
        .about-card p { margin: 0 0 10px; color: #444; line-height: 1.6; font-size: 14px; }
        .about-card p:last-child { margin-bottom: 0; }

        .feature-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 16px; }
        .feature { border: 1px solid #eee; border-left: 4px solid #c8102e; border-radius: 8px;
                   padding: 14px 16px; background: #fafafa; }
        .feature strong { display: block; margin-bottom: 4px; color: #222; font-size: 14px; }
        .feature span { color: #666; font-size: 13px; line-height: 1.5; }

        .about-list { margin: 0; padding-left: 20px; color: #444; font-size: 14px; line-height: 1.8; }
        .timeline { margin: 0; padding: 0; list-style: none; border-left: 3px solid #c8102e; }
.timeline li { position: relative; padding: 0 0 16px 22px; color: #444; font-size: 14px; line-height: 1.6; }
.timeline li:last-child { padding-bottom: 0; }
.timeline li::before { content: ""; position: absolute; left: -9px; top: 6px; width: 15px; height: 15px;
                       background: #c8102e; border: 3px solid #fff; border-radius: 50%;
                       box-shadow: 0 0 0 1px #c8102e; }
.timeline strong { color: #222; display: block; }
    </style>

    <div class="about-page">
        <div class="about-wrap">

            <div class="about-title">About the Avis System</div>
            <div class="about-subtitle">A car rental management system for Avis branches and staff.</div>

            <div class="about-card">
                <h3>Overview</h3>
                <p>
                    The Avis System manages the full car rental process in one place, from the moment a customer
                    books a vehicle to the day it is returned and inspected. It replaces paper records and
                    spreadsheets with a single secure system that every branch can use.
                </p>
                <p>
                    Staff can see which vehicles are available, take bookings and payments, record returns and
                    inspections, and follow up on claims, with each record linked to the booking it belongs to.
                </p>
            </div>

            <div class="about-card">
                <h3>What the system does</h3>
                <div class="feature-grid">
                    <div class="feature">
                        <strong>Bookings and rentals</strong>
                        <span>Reserve vehicles, confirm bookings, and track each rental from pickup to return.</span>
                    </div>
                    <div class="feature">
                        <strong>Vehicle returns</strong>
                        <span>Record the return date, branch, days charged and any additional charges.</span>
                    </div>
                    <div class="feature">
                        <strong>Inspections</strong>
                        <span>Log fuel level, odometer reading and damage at pickup and return, with damage charges.</span>
                    </div>
                    <div class="feature">
                        <strong>Payments</strong>
                        <span>Take payment for bookings, return charges and inspection charges, with an invoice for each.</span>
                    </div>
                    <div class="feature">
                        <strong>Claims</strong>
                        <span>File claims against an inspection report and track their status and responsible party.</span>
                    </div>
                    <div class="feature">
                        <strong>Branches and vehicles</strong>
                        <span>Manage the vehicle fleet and the branches where vehicles are collected and returned.</span>
                    </div>
                    <div class="feature">
                        <strong>Employees</strong>
                        <span>Keep staff records, so each inspection and transaction is tied to the employee who captured it.</span>
                    </div>
                    <div class="feature">
                        <strong>Reports</strong>
                        <span>View and filter records, such as inspection reports by employee, branch, type and date.</span>
                    </div>
                </div>
            </div>

            <div class="about-card">
                <h3>Who it is for</h3>
                <ul class="about-list">
                    <li>Branch staff who handle bookings, pickups, returns and payments</li>
                    <li>Administrators who manage employees, vehicles, branches and reports</li>
                    <li>Customers, who book and pay for their rentals online</li>
                </ul>
            </div>

            <div class="about-card">
                <h3>Security</h3>
                <p>
                    Access requires a login. Staff pages are limited to signed-in users, and card details
                    entered when paying are validated but are not stored in the database.
                </p>
            </div>
            <div class="about-card">
    <h3>The history of Avis</h3>
    <p>
        Avis is one of the oldest car rental brands in the world. The system is named after it
        and follows the same idea: make renting a car simple and reliable.
    </p>
    <ul class="timeline">
        <li>
            <strong>1946: The beginning</strong>
            Warren Avis founded Avis in Michigan, USA, and opened rental counters at airports,
            at a time when few companies rented cars to travellers there.
        </li>
        <li>
            <strong>1954: New ownership</strong>
            Warren Avis sold the company, and Avis began to grow beyond the United States.
        </li>
        <li>
            <strong>1962: "We Try Harder"</strong>
            Avis was the second-largest rental company, and it turned that into a famous advertising
            campaign built around the slogan "We Try Harder", which put service first.
        </li>
        <li>
            <strong>1960s to 1990s: Growth and changing owners</strong>
            Avis was owned by several large groups over these decades and kept expanding its
            network of branches around the world.
        </li>
        <li>
            <strong>2006: Avis Budget Group</strong>
            Avis and Budget came together under one company, Avis Budget Group, which later
            added the car-sharing brand Zipcar.
        </li>
        <li>
            <strong>Today</strong>
            Avis operates in many countries, with branches at airports and in cities.
            Southern Africa is one of the regions it serves.
        </li>
    </ul>
</div>

        </div>
    </div>
</asp:Content>
