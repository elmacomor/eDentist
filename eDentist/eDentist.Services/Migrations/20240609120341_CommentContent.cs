using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace eDentist.Services.Migrations
{
    /// <inheritdoc />
    public partial class CommentContent : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Content",
                table: "Comment",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.UpdateData(
                table: "Appointments",
                keyColumn: "AppointmentID",
                keyValue: 1,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 924, DateTimeKind.Local).AddTicks(9679));

            migrationBuilder.UpdateData(
                table: "MedicalCard",
                keyColumn: "MedicalCardID",
                keyValue: 1,
                column: "datumDijagnoze",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 924, DateTimeKind.Local).AddTicks(9731));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 1,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(3881));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 2,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(3920));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 3,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(3955));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 4,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(3975));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 5,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(4025));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 6,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(4045));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 7,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(4064));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 8,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(4084));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 9,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(4104));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 10,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(4151));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 11,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(4171));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 12,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(4191));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 13,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(4209));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 14,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(4227));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 15,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(4275));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 1,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(3898));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 2,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(3925));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 3,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(3960));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 4,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(3980));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 5,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(4030));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 6,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(4050));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 7,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(4070));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 8,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(4089));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 9,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(4109));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 10,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(4156));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 11,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(4176));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 12,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(4196));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 13,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(4214));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 14,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(4260));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 15,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(4280));

            migrationBuilder.UpdateData(
                table: "TransakcijaZaUslugu",
                keyColumn: "TranskcijaId",
                keyValue: 1,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 14, 3, 40, 925, DateTimeKind.Local).AddTicks(4297));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Content",
                table: "Comment");

            migrationBuilder.UpdateData(
                table: "Appointments",
                keyColumn: "AppointmentID",
                keyValue: 1,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(3725));

            migrationBuilder.UpdateData(
                table: "MedicalCard",
                keyColumn: "MedicalCardID",
                keyValue: 1,
                column: "datumDijagnoze",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(3777));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 1,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8564));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 2,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8616));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 3,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8655));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 4,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8677));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 5,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8730));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 6,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8751));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 7,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8773));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 8,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8793));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 9,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8812));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 10,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8866));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 11,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8887));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 12,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8907));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 13,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8927));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 14,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8974));

            migrationBuilder.UpdateData(
                table: "OrderHeader",
                keyColumn: "OrderHeaderID",
                keyValue: 15,
                column: "OrderDate",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8995));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 1,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8588));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 2,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8622));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 3,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8661));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 4,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8682));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 5,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8736));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 6,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8757));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 7,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8778));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 8,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8798));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 9,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8848));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 10,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8871));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 11,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8892));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 12,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8912));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 13,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8932));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 14,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(8980));

            migrationBuilder.UpdateData(
                table: "Transactions",
                keyColumn: "TranskcijaId",
                keyValue: 15,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(9000));

            migrationBuilder.UpdateData(
                table: "TransakcijaZaUslugu",
                keyColumn: "TranskcijaId",
                keyValue: 1,
                column: "Datum",
                value: new DateTime(2024, 6, 9, 13, 22, 11, 237, DateTimeKind.Local).AddTicks(9020));
        }
    }
}
