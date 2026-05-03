using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace eDentist.Services.Migrations
{
    /// <inheritdoc />
    public partial class recommendResult : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "RecommendResult",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProizvodId = table.Column<int>(type: "int", nullable: true),
                    PrviProizvodId = table.Column<int>(type: "int", nullable: true),
                    DrugiProizvodId = table.Column<int>(type: "int", nullable: true),
                    TreciProizvodId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RecommendResult", x => x.Id);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "RecommendResult");
        }
    }
}
