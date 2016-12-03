# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@admin = OfficerRole.create(role: "Admin")
@supervisor = OfficerRole.create(role: "Supervisor")
@staff = OfficerRole.create(role: "Staff")
@norole = OfficerRole.create(role: "NoRole")

# Admin
User.create(email: "admin@ait.asia", password: "secret123",
            password_confirmation: "secret123", staff_id: "ad111111", officer_role_id: @admin.id)
# Supervisor
User.create(email: "supervisor@ait.asia", password: "secret123",
            password_confirmation: "secret123", staff_id: "sp111112", officer_role_id: @supervisor.id)
# Staff
User.create(email: "staff@ait.asia", password: "secret123",
            password_confirmation: "secret123", staff_id: "st111113", officer_role_id: @staff.id)
# NoRole
User.create(email: "newstaff@ait.asia", password: "secret123",
            password_confirmation: "secret123", staff_id: "st111114", officer_role_id: @norole.id)