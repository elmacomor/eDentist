using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace eDentist.Services.Migrations
{
    /// <inheritdoc />
    public partial class OrderHeaderUpdate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Status",
                table: "OrderHeader",
                type: "nvarchar(max)",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Status",
                table: "OrderHeader");
        }
    }
}
